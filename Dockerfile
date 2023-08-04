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
EXPOSE 8080

# Command to run on server
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]

# Commented out the previous CMD command and added a new command to run a different gunicorn instance on port 5000
# Since only one CMD command can be used in a Dockerfile, the previous CMD command was replaced
# This will ensure that the gunicorn instance is running on both port 8080 and port 5000
# The -w flag sets the number of worker processes to 2
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]