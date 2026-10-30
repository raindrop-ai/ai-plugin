#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
source_dir="$(mktemp -d)"
trap 'rm -rf "$source_dir"' EXIT

git clone --quiet --depth 1 https://github.com/raindrop-ai/skills.git "$source_dir/upstream"
mkdir "$source_dir/skills"
for skill in "$source_dir"/upstream/raindrop-*/; do
  if [ -f "$skill/SKILL.md" ]; then
    cp -R "${skill%/}" "$source_dir/skills/"
  fi
done

if [ -z "$(ls -A "$source_dir/skills")" ]; then
  echo "No skills found in raindrop-ai/skills." >&2
  exit 1
fi

mkdir -p "$repo_root/skills"
rsync -a --delete "$source_dir/skills/" "$repo_root/skills/"
echo "Synced skills from $(git -C "$source_dir/upstream" rev-parse --short HEAD)."
