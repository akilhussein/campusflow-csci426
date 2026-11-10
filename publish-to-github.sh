#!/usr/bin/env bash
# CampusFlow CSCI426: publish local Git history to GitHub.
set -euo pipefail
cd "$(dirname "$0")"
command -v git >/dev/null || { echo 'Install Git first.' >&2; exit 1; }
command -v gh >/dev/null || { echo 'Install GitHub CLI from https://cli.github.com/ first.' >&2; exit 1; }
if ! gh auth status >/dev/null 2>&1; then gh auth login --web --git-protocol https; fi
expected=12032486-sketch
actual="$(gh api user -q '.login')"
[[ "$actual" == "$expected" ]] || { echo "Signed in as '$actual', expected '$expected'." >&2; exit 1; }
# Save the verified production screenshots into the repository before publishing.
bash download-screenshots.sh
git add README.md docs/browser-qa-results.json docs/screenshots download-screenshots.ps1 download-screenshots.sh publish-to-github.sh
if ! git diff --cached --quiet; then git commit -m 'Add verified browser QA and production screenshots'; fi
git branch -M main
repo=12032486-sketch/campusflow-csci426
if gh repo view "$repo" >/dev/null 2>&1; then
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$repo.git"
  git push -u origin main
else
  gh repo create "$repo" --public --source . --remote origin --push --description 'React student portal for CSCI426 Advanced Web Programming Phase 1'
fi
echo "Published: https://github.com/$repo"
