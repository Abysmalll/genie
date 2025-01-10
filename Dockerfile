# Use Python 3.10 slim as the base image
FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

# Set working directory to /
WORKDIR /

# Clone the repository into /app
RUN git clone https://github.com/Abysmalll/ssti_1.git /app

# Set the working directory to /app (where the Flask app is)
WORKDIR /app

# Install Flask and any other dependencies
RUN pip install --no-cache-dir flask

# Expose port 80 as used in your docker-compose.yml
EXPOSE 80

# Set FLASK_APP environment variable to point to the app.py
ENV FLASK_APP=/app/app/app.py

# Change working directory to app
WORKDIR /app/app

# Set the command to run the Flask app
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "80"]
