# Stage 1: Build and test the application
FROM python:3.9 AS builder

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY app.py .
COPY tests/ tests/

# Install pytest and run the tests
RUN pip install pytest
RUN pytest

# Stage 2: Build the final image
FROM python:3.9

WORKDIR /app

# Copy only the necessary files from the previous stage
COPY --from=builder /app/app.py .
COPY --from=builder /app/requirements.txt .
COPY --from=builder /app/tests/ tests/

# Install the application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the default environment variable
ENV NAME World

# Expose the port on which the application will run
EXPOSE 80

# Start the application
CMD ["python", "app.py"]




# # Use a base image with Python installed
# FROM python:3.9

# # Set the working directory
# WORKDIR /app

# # Copy the requirements file and install dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the application code into the container
# COPY app.py .
# COPY tests/ tests/

# # Install pytest and run the tests
# RUN pip install pytest
# RUN pytest

# # Set the default environment variable
# ENV NAME World

# # Expose the port on which the application will run
# EXPOSE 80

# # Start the application
# CMD ["python", "app.py"]