
# Use a base image with Python 3.7
FROM python:3.7

# Copy the contents of the app folder to the current working directory in the container
COPY ./app /app

# Set the working directory to /app
WORKDIR /app

# Install the Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# Set a default value for the $PORT variable
ENV PORT=8000

# Expose the port specified by the $PORT variable
EXPOSE $PORT

# Start the application using gunicorn
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
