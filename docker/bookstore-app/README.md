**BookStore App (2-Tier: React + Express API)**

**Overview**

The BookStore App is a simple 2-tier web application with:
Frontend: React (served via Nginx)
Backend: Node.js + Express API

The backend provides REST APIs for books, while the frontend interacts with it.

🚀 Setup & Run

Clone the repo:

git clone <repo_url>
cd bookstore-app


Build & start with Docker Compose:

docker compose up --build


Access:

Frontend → http://localhost:3000

Backend API → http://localhost:5000/api/books

🛠️ Services

Frontend: Built with React → static files → served via Nginx

Backend: Express API, serving book data (JSON)

Example API
GET /api/books


Response:

[
  { "id": 1, "title": "Docker Made Easy" },
  { "id": 2, "title": "Learning React" }
]
