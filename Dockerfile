# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy backend and frontend folders
COPY backend backend/
COPY frontend frontend/

# Install backend dependencies
WORKDIR /app/backend
RUN npm install

# Install static file server
RUN npm install -g serve

# Go back to root
WORKDIR /app

# Expose backend and frontend ports
EXPOSE 3000
EXPOSE 5000

# Start both backend and frontend servers
CMD sh -c "node backend/server.js & serve -s frontend -l 5000"
