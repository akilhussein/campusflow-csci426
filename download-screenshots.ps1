# Fetch real screenshot assets from the verified Vercel production deployment.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$base = 'https://campusflow-csci426.vercel.app/screenshots'
$folder = Join-Path $PSScriptRoot 'docs\screenshots'
New-Item -ItemType Directory -Force -Path $folder | Out-Null
$names = @(
  'dashboard-desktop.jpg',
  'courses-desktop.jpg',
  'planner-desktop.jpg',
  'performance-desktop.jpg',
  'dashboard-mobile.jpg',
  'mobile-menu.jpg'
)
foreach ($name in $names) {
    $dst = Join-Path $folder $name
    Invoke-WebRequest -Uri "$base/$name" -OutFile $dst -UseBasicParsing
    $bytes = [IO.File]::ReadAllBytes($dst)
    if ($bytes.Length -lt 4000 -or $bytes[0] -ne 255 -or $bytes[1] -ne 216 -or $bytes[2] -ne 255) {
        throw "The screenshot download was not a valid JPEG: $name"
    }
    Write-Host "Verified: $name ($($bytes.Length) bytes)"
}
Write-Host 'All six genuine browser screenshots are now saved in docs/screenshots.'
