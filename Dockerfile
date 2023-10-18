FROM ubuntu:focal

# Set maintainer label
LABEL maintainer="krzynio@gmail.com"

# Set environment variables for non-interactive (to avoid some prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages for the environment
RUN apt-get update && \
    apt-get install -y gnupg wget software-properties-common python3-pip && \
    wget -O - http://download.sgjp.pl/apt/sgjp.gpg.key | apt-key add - && \
    apt-add-repository http://download.sgjp.pl/apt/ubuntu && \
    apt-get update && apt-get install -y morfeusz2-dictionary-polimorf morfeusz2-dictionary-sgjp python3-morfeusz2 

# Install Python packages
RUN pip3 install starlette uvicorn python-multipart
# Copy API script into container
COPY ./api.py /app/api.py

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Set the default command to run the Starlette API
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]

