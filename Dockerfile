
# Builder stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Production stage
FROM node:20-alpine AS production
WORKDIR /app
# Only copy node_modules and built files from builder
# COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/src ./src
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/README.md ./README.md
# Optional: include README.md for metadata
COPY --from=builder /app/README.md ./README.md

EXPOSE 3000
CMD ["npm", "start"]
