#!/bin/sh
set -e

github_user=ronen

if command -v chezmoi >/dev/null; then
  chezmoi init --apply "${github_user}"
else
  # downloads and installs chezmoi into .local/bin
  sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply "${github_user}"
fi
