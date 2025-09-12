const express = require('express');
const mysql = require('mysql2');
const app = express();
app.use(express.json());
const PORT = process.env.PORT || 5000;

const db = mysql.createPool({
  host: process.env.DB_HOST || 'db',
  user: process.env.DB_USER || 'appuser',
  password: process.env.DB_PASSWORD || 'apppass',
  database: process.env.DB_NAME || 'pizzadb',
  waitForConnections: true,
  connectionLimit: 10
});

app.get('/api/menu', (req,res)=>{
  db.query('SELECT * FROM menu', (err,rows)=>{
    if(err) return res.status(500).json({error:err.message});
    res.json(rows);
  });
});

app.post('/api/order', (req,res)=>{
  const { item_id, qty } = req.body;
  if(!item_id || !qty) return res.status(400).json({error:'item_id and qty required'});
  db.query('INSERT INTO orders (item_id, qty) VALUES (?,?)', [item_id, qty], (err,result)=>{
    if(err) return res.status(500).json({error:err.message});
    res.json({orderId: result.insertId});
  });
});

app.listen(PORT, ()=>console.log('Pizza backend running on', PORT));
