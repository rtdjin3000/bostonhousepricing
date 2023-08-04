## Dockerfile for Back4App Cloud Deployment
# Base Image
FROM python:3.7

# Work directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy other project files
COPY . .

# Expose a port to Containers 
EXPOSE 5000

# Command to run on server
#CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]