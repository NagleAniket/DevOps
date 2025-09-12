const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

const books = [
  { id: 1, title: "Clean Code", author: "Robert C. Martin" },
  { id: 2, title: "The Pragmatic Programmer", author: "Andrew Hunt" },
  { id: 3, title: "Design Patterns", author: "Erich Gamma" }
];

app.get('/api/books', (req, res) => {
  res.json(books);
});

app.listen(PORT, () => console.log(`Bookstore backend listening on ${PORT}`));
