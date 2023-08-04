
# The image build failed because the Dockerfile does not specify the filename for the COPY instruction.
# We need to specify the filename in the source and destination paths for the COPY instruction.

FROM python:3.7
COPY ./app/requirements.txt /app/requirements.txt # We specify the filename `requirements.txt` in the source and destination paths.
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
