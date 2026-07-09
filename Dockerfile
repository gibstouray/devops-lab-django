FROM python:3.12-slim

WORKDIR /app

# Install system deps if needed
# RUN apt-get update && apt-get install -y gcc libpq-dev

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"] - do not use in production, use gunicorn instead
CMD ["gunicorn", "devops_lab_app.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
