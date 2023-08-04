# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM python:3.7

WORKDIR /app

# set environmental variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install the requirements
COPY ./app
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

COPY . .

# initialize the database (create DB, tables, populate)
RUN python init_db.py

EXPOSE 5000/tcp

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]