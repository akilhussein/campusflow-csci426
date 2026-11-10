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
$expected = '12032486-sketch'
$actual = (gh api user -q '.login').Trim()
if ($actual -ne $expected) { throw "Signed in as '$actual', expected '$expected'. Please verify the account before publishing." }
git branch -M main
$repo = '12032486-sketch/campusflow-csci426'
gh repo view $repo *> $null
if ($LASTEXITCODE -eq 0) {
  $origin = git remote get-url origin 2>$null
  if (-not $origin) { git remote add origin "https://github.com/$repo.git" }
  git push -u origin main
} else {
  gh repo create $repo --public --source . --remote origin --push --description 'React student portal for CSCI426 Advanced Web Programming Phase 1'
}
if ($LASTEXITCODE -ne 0) { throw 'GitHub publishing failed. Review the error above.' }
Write-Host "Published: https://github.com/$repo"
