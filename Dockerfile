# Use Node.js LTS version as the base image
FROM node:lts

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json for the server
COPY server/package*.json ./server/

# Install server dependencies
RUN cd server && npm install

# Copy package.json and package-lock.json for the client
COPY client/package*.json ./client/

# Install client dependencies
RUN cd client && npm install

# Copy the server and client code
COPY server/ ./server/
COPY client/ ./client/

# Build the React app
RUN cd client && npm run build

# Expose the port that the server will run on
EXPOSE 3001

# Command to start the server
CMD ["node", "./server/index.js"]
