# CampusFlow CSCI426: publish local Git history to GitHub.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Install Git first: https://git-scm.com/downloads' }
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'Install GitHub CLI first: https://cli.github.com/' }
gh auth status 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host 'Please authorize GitHub CLI in your browser.'
  gh auth login --web --git-protocol https
  if ($LASTEXITCODE -ne 0) { throw 'GitHub login was not completed.' }
}
$expected = 'akilhussein'
$actual = (gh api user -q '.login').Trim()
if ($actual -ne $expected) { throw "Signed in as '$actual', expected '$expected'. Please verify the account before publishing." }
# Capture the hosted, real browser screenshots in the GitHub repository.
& (Join-Path $PSScriptRoot 'download-screenshots.ps1')
git add README.md docs/browser-qa-results.json docs/screenshots download-screenshots.ps1 download-screenshots.sh publish-to-github.ps1
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
    git commit -m 'Add verified browser QA and production screenshots'
    if ($LASTEXITCODE -ne 0) { throw 'Could not commit screenshot and QA files.' }
}
git branch -M main
$repo = 'akilhussein/campusflow-csci426'
gh repo view $repo *> $null
if ($LASTEXITCODE -eq 0) {
  $remotes = @(git remote)
  if ('origin' -notin $remotes) { git remote add origin "https://github.com/$repo.git" }
  $origin = (git remote get-url origin).Trim()
  if ($origin -ne "https://github.com/$repo.git" -and $origin -ne "git@github.com:$repo.git") { throw "Unexpected Git remote: $origin" }
  git push -u origin main
} else {
  gh repo create $repo --public --source . --remote origin --push --description 'React student portal for CSCI426 Advanced Web Programming Phase 1'
}
if ($LASTEXITCODE -ne 0) { throw 'GitHub publishing failed. Review the error above.' }
Write-Host "Published: https://github.com/$repo"

