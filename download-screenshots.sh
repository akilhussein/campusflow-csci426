#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p docs/screenshots
base=https://campusflow-csci426.vercel.app/screenshots
for name in dashboard-desktop.jpg courses-desktop.jpg planner-desktop.jpg performance-desktop.jpg dashboard-mobile.jpg mobile-menu.jpg; do
  curl -fL --retry 2 --max-time 30 "$base/$name" -o "docs/screenshots/$name"
  test "$(wc -c < "docs/screenshots/$name")" -gt 4000 || { echo "Invalid downloaded screenshot: $name" >&2; exit 1; }
  echo "Downloaded: $name"
done
echo 'Six real screenshots saved to docs/screenshots.'
