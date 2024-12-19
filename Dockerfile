# Use official Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy pyproject.toml and poetry.lock into the container
COPY pyproject.toml poetry.lock /app/

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy the rest of the application code
COPY . /app/

# Expose port (optional, specify your app's port)
EXPOSE 8000

# Command to run your app (replace with your actual entry point)
CMD ["poetry", "run", "python", "app.py"]