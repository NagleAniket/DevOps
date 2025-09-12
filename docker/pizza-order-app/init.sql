CREATE DATABASE IF NOT EXISTS pizzadb;
USE pizzadb;
CREATE TABLE IF NOT EXISTS menu (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(6,2)
);
CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT,
  qty INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO menu (name, price) VALUES ('Margherita', 5.99), ('Pepperoni', 7.50), ('Veggie', 6.75);
