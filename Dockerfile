FROM python:latest

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python", "-m", "uvicorn", "django_demo_site.asgi:application", "--host", "0.0.0.0"]