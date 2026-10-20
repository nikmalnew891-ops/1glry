FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies untuk kompilasi library Python (protobuf, pycryptodome, dll)
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    python3-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements dan install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file project
COPY . .

# Buat folder data (untuk Railway Volume)
RUN mkdir -p /app/data

# Jalankan bot
CMD ["python", "-u", "main.py"]