FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file
COPY ./requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./entrypoint.py .

# Expose the application's port (if Flask defaults to 5000, adjust as needed)
EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "entrypoint:app"]
