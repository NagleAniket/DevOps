# BookStore App (2-tier)

**Stack:** React (frontend) + Node/Express (backend)

## Overview
A simple bookstore webapp where the frontend fetches a list of books from the backend.

## Folder structure
```
bookstore-app/
  backend/
    server.js
    package.json
    Dockerfile
  frontend/
    public/index.html
    src/App.js
    src/index.js
    package.json
    Dockerfile
  docker-compose.yml
```

## Run
1. Build and start:
```bash
docker compose up --build
```
2. Frontend: http://localhost:3000  
   Backend API: http://localhost:5000/api/books

## Notes
- Frontend is built then served by nginx in the Dockerfile.
- Change ports in `docker-compose.yml` if needed.
