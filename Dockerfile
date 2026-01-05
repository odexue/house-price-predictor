FROM python:3.11-slim

WORKDIR /app

COPY src/api/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY src/api/main.py /app/main.py
COPY src/api/schemas.py /app/schemas.py
COPY src/api/inference.py /app/inference.py
COPY src/api/utils.py /app/utils.py
COPY models/trained /app/models/trained

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
