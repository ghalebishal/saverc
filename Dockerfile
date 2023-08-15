
FROM python:3.9.2-slim-buster

# Create a directory for the application
RUN mkdir /app && chmod 777 /app

# Set the working directory
WORKDIR /app

# Set environment variable for noninteractive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Update the package index and install required dependencies
RUN apt-get update && apt-get install -y git python3 python3-pip ffmpeg

# Copy the application files to the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose a TCP port for the application
EXPOSE 8000

# Set the default command to run the bash.sh script
CMD ["bash","bash.sh"]
