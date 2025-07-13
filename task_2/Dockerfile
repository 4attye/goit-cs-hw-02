# Dockerfile

FROM python:3.11-slim

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .

# Встановлюємо залежності
RUN apt-get update && \
    apt-get install -y libpq-dev gcc && \
    pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проєкт
COPY . .

# Запускаємо FastAPI сервер
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
