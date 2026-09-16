#!/bin/bash

# ЗАМЕНИ ЭТУ ССЫЛКУ НА ПРЯМУЮ ССЫЛКУ К СПИСКУ НА GITLAB
GITLAB_RAW_URL="https://raw.githubusercontent.com/roosterkid/openproxylist/main/V2RAY_RAW.txt"

# Скачиваем во временный файл
curl -sSL "$GITLAB_RAW_URL" -o new_config.txt

# Проверяем, что файл скачался и не пустой
if [ -s new_config.txt ]; then
  # Если файл отличается от текущего config.txt — обновляем
  if ! cmp -s new_config.txt config.txt; then
    mv new_config.txt config.txt
    echo "Config updated."
  else
    echo "No changes."
    rm new_config.txt
  fi
else
  echo "Failed to download or empty file."
  rm -f new_config.txt
  exit 1
fi
