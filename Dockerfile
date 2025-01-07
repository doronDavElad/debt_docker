

FROM python:3.11-slim

WORKDIR /app

COPY backend /app/backend

COPY requirements.in /app/requirements.in 

RUN pip install pip-tools

RUN pip-compile /app/requirements.in --output-file=/app/backend/requirements.txt  # Generate requirements.txt


RUN pip install --no-cache-dir -r /app/backend/requirements.txt

CMD ["python", "/app/backend/main.py"]

COPY backend/app/ai/agents /app/ai/agents

CMD ["python", "/app/backend/main.py"]
