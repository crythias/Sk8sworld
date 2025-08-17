
# Builder stage. This stage installs dependencies and prepares the app
FROM node:20-alpine AS builder
RUN echo "🔧 You are in the builder stage"
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Production stage. This stage is optimized for running the app
FROM node:20-alpine AS production
RUN echo "🚀 Welcome to the production stage"
WORKDIR /app
# Only copy node_modules and built files from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/src ./src
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/README.md ./README.md

# Port the app runs on (make sure it matches your app's configuration)
EXPOSE 3000

# Start the application. Make sure this matches your start script in package.json
CMD ["npm", "start"]
