FROM python:3.12-slim

WORKDIR /app

COPY wheels ./wheels
COPY requirements.txt .
RUN pip install --no-cache-dir --no-index --find-links=/app/wheels -r requirements.txt

COPY train.py app.py ./

RUN python train.py

EXPOSE 5000

CMD ["python", "app.py"]
