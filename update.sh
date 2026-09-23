#!/bin/bash

# Источник VLESS-списка (и других протоколов)
SOURCE_URL="https://raw.githubusercontent.com/FLAT447/v2ray-lists/refs/heads/main/BLACK_LTE.txt"

# Скачиваем во временный файл
curl -sSL "$SOURCE_URL" -o new_config.txt

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
