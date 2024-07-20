# Use a more comprehensive Python image
FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    liblzma-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    libxslt1-dev \
    zlib1g-dev \
    gcc \
    python3-dev

# Copy the requirements file into the container
COPY requirements.txt .

# Print the contents of requirements.txt to debug
RUN cat requirements.txt

# Upgrade pip
RUN pip install --upgrade pip

# Install dependencies with verbose logging to debug
RUN pip install -v -r requirements.txt

# Copy the rest of the working directory contents into the container
COPY . .

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
