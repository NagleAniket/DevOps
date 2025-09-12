# Pizza Order System (3-tier)

**Stack:** React (frontend) + Node/Express (backend) + MySQL (database)

## Overview
A small pizza ordering demo where the frontend reads menu from backend, and you can place a dummy order which is recorded in MySQL.

## Folder structure
```
pizza-order-app/
  init.sql
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
1. Start services:
```bash
docker compose up --build
```
2. Frontend: http://localhost:3001  
   Backend API: http://localhost:5001/api/menu and /api/order  
   MySQL: localhost:3306 (user/appuser, password/apppass)

## Notes
- `init.sql` seeds the `menu` table at container initialization.
- If MySQL already has data, the seed may not run (default docker-entrypoint behavior).
