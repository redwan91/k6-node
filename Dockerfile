# First stage: Build stage
FROM node:18 AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy all contents from the repository into the Docker image
COPY . .

# Install Node.js dependencies
RUN npm install

# Ensure the dist directory exists
RUN mkdir -p /usr/src/app/dist

# Run Rollup to bundle the JavaScript files
RUN npm run rollup

# Second stage: k6 runtime stage
FROM grafana/k6:latest

# Copy the bundled test files from the builder stage
COPY --from=builder /usr/src/app/dist /test

RUN k6 run /test/test.js

