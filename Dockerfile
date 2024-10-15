ARG PYTHON_VERSION=3.12.7
FROM python:${PYTHON_VERSION}-slim

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copy the source code into the container.
COPY . .

# Install any needed dependencies specified in requirements.txt.
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the application listens on.
EXPOSE 8080

# Define environment variable to ensure Flask runs correctly in container.
ENV FLASK_APP=app.py

# Run app.py when the container launches.
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]