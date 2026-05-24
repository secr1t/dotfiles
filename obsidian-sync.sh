#!/bin/bash
set -euo pipefail

VAULTS=(
  "/mnt/seagate/Obsidian/personal"
  "/mnt/seagate/Obsidian/edge"
)

for DIR in "${VAULTS[@]}"; do
  cd "$DIR" || continue
  echo "=== $DIR ==="

  # лечим сломанные состояния
  [ -d ".git/rebase-merge" ] && git rebase --abort || true
  [ -f ".git/MERGE_HEAD" ] && git merge --abort || true

  # коммитим локальные изменения
  if [[ -n $(git status --porcelain) ]]; then
    git add .
    git commit -m "auto-local: $(date '+%Y-%m-%d %H:%M')"
  fi

  # подтягиваем удалённые изменения
  git fetch origin

  # делаем merge с приоритетом локальных файлов
  git merge -X ours origin/main || {
    echo "merge failed, forcing ours strategy"
    git merge --abort || true
    git reset --hard origin/main
    continue
  }

  # пушим
  git push origin main || {
    echo "push failed"
    continue
  }

  echo "ok"
done
