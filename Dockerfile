# Use the official slim Python image from the Docker Hub
FROM python:3.12-slim

# Set environment variables
ENV POETRY_VERSION=1.8.3 \
    POETRY_HOME=/opt/poetry \
    VENV_PATH=/application/.venv \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/application/app/src

# Create application directory
WORKDIR /application

# Install system dependencies for Poetry and other tools
RUN apt-get update && \
    apt-get install -y \
    curl \
    build-essential \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

# Copy the application code to the container
COPY . /application/

# Install dependencies using Poetry
RUN poetry install --no-root -vvv --sync

# Copy entrypoint script and give it execute permissions
COPY ./start-local.sh /application/start-local.sh
RUN chmod +x /application/start-local.sh

# Expose the port on which the FastAPI application will run
EXPOSE 3000

# Set the entrypoint for the container
ENTRYPOINT ["/application/start-local.sh"]
