
# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any packages needed specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Changed "--no-dir-cache" to "--no-cache-dir" to fix typo

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
