
# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any packages needed specified in requirements.txt
RUN pip install --no-dir-cache -r requirements.txt

# Make port 80 available to the world outside this container
# EXPOSE 80  - Commented out as it is not necessary to expose port 80

# Define environment variable
ENV NAME World

# Add a health check command
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD curl --fail http://localhost:5000 || exit 1
# Changed the port from 80 to 5000 in the health check command to match the exposed port below

# Expose port 5000
EXPOSE 5000
# Added a new line to expose port 5000

# Run app.py when the container launches
CMD ["python", "app.py"]
