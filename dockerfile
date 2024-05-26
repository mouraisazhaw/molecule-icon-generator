FROM python:3.10-slim

# Install necessary system libraries
RUN apt-get update && apt-get install -y \
    libxext6 \
    libxrender1 \
    libsm6 \
    libice6 \
    && rm -rf /var/lib/apt/lists/*

# Copy your application code to the container
COPY . /usr/app

# Set the working directory
WORKDIR /usr/app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run your application
CMD ["streamlit", "run", "streamlit-app.py"]