-- reservation_system.sql
-- Script to create the ReservationSystem Database and related tables

-- 1. Create the ReservationSystem Database
CREATE DATABASE IF NOT EXISTS ReservationSystem;
USE ReservationSystem;

-- 2. Create Users Table
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Customer', 'Hotel', 'Restaurant') NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    organization VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastLogin DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert Example Data into Users
INSERT INTO Users (name, email, password, role, phone, address, organization) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'hashed_password', 'Customer', '+1234567890', '123 Main St, New York, NY', NULL),
('Bob Smith', 'bob.smith@hotelxyz.com', 'hashed_password', 'Hotel', '+1987654321', '123 Beach Ave, Miami, FL', 'Hotel XYZ');

-- 3. Create Rooms Table
CREATE TABLE IF NOT EXISTS Rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomType VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    price DECIMAL(10, 2) NOT NULL,
    capacity INT NOT NULL,
    availability BOOLEAN DEFAULT TRUE,
    features TEXT,
    createdBy INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (createdBy) REFERENCES Users(id)
);

-- Insert Example Data into Rooms
INSERT INTO Rooms (roomType, latitude, longitude, price, capacity, availability, features, createdBy) VALUES
('Deluxe Room', 40.7128, -74.0060, 250.00, 2, TRUE, 'Ocean view, King bed, Free WiFi', 2),
('Standard Room', 37.7749, -122.4194, 150.00, 2, TRUE, 'City view, Queen bed, Free WiFi', 2);

-- 4. Create Tables Table
CREATE TABLE IF NOT EXISTS Tables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tableNumber INT NOT NULL,
    location VARCHAR(100),
    capacity INT NOT NULL,
    availability BOOLEAN DEFAULT TRUE,
    createdBy INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (createdBy) REFERENCES Users(id)
);

-- Insert Example Data into Tables
INSERT INTO Tables (tableNumber, location, capacity, availability, createdBy) VALUES
(5, 'Near Window', 4, TRUE, 2),
(6, 'Patio', 2, TRUE, 2);

-- 5. Create Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    roomId INT,
    tableId INT,
    bookingTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmed', 'Pending', 'Canceled') NOT NULL,
    paymentStatus ENUM('Paid', 'Pending', 'Failed') NOT NULL,
    notes TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES Users(id),
    FOREIGN KEY (roomId) REFERENCES Rooms(id),
    FOREIGN KEY (tableId) REFERENCES Tables(id)
);

-- Insert Example Data into Bookings
INSERT INTO Bookings (userId, roomId, tableId, status, paymentStatus, notes) VALUES
(1, 1, NULL, 'Confirmed', 'Paid', 'Special request for an ocean view room.'),
(1, NULL, 1, 'Pending', 'Pending', 'Please confirm the availability of a table for 2.');

-- Indexes for Performance Optimization
CREATE UNIQUE INDEX idx_email ON Users(email);
CREATE INDEX idx_location ON Rooms(latitude, longitude);
CREATE INDEX idx_status_payment ON Bookings(status, paymentStatus);
