CREATE DATABASE IF NOT EXISTS biocode;
USE biocode;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    contact VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS inventions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    inventionName VARCHAR(255) NOT NULL,
    filePath VARCHAR(255),
    price DECIMAL(10, 2),
    isCertified BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (userId) REFERENCES users(id)
);
