#!/bin/bash

LOG_FILE="website_status.log"

# Список веб-сайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Очищення файлу логів перед початком перевірки
> "$LOG_FILE"

# Перквірка кожного веб-сайту
for site in "${websites[@]}"; do
    # Надсилання GET-запиту з обробкою переадресації, таймаутом і виведенням лише статус-коду
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")

    if [ "$status_code" -eq 200 ]; then
        result="<$site> is UP"
    else
        result="<$site> is DOWN"
    fi

    # Запис результату у файл логів
    echo "$result" >> "$LOG_FILE"
done