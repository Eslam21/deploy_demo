
# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any packages needed specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Add a health check command
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

# Run app.py when the container launches
CMD ["python", "app.py"]
