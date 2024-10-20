# Start from the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy all contents from the repository into the Docker image
COPY . .

# Move the k6 binary from the binaries folder to /usr/local/bin
RUN mv /usr/src/app/binaries/k6 /usr/local/bin/k6 \
    && chmod +x /usr/local/bin/k6

RUN mkdir -p /usr/src/app/dist && chmod -R 777 /usr/src/app/dist
# Confirm k6 installation
RUN k6 version

# Install Node.js dependencies
RUN npm install

# Run Rollup to bundle the JavaScript files
# Command to run your Node.js application
RUN npm run rollup

RUN k6 run dist/test.js
