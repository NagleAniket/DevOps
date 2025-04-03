# BASE

FROM node:18-alpine

# Working DIR

WORKDIR /app

# Copy CODE

COPY . .

# Code build and install

RUN npm install && npm run build


# Expose port

EXPOSE 3000

# Serve Application

CMD ["npm","run","dev"]
