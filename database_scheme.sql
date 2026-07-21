-- ===================================================
-- Motor Vehicle Insurance Management System Database
-- ===================================================

CREATE DATABASE motor_vehicle_insurance;
USE motor_vehicle_insurance;

-- =====================================
-- 1. CUSTOMER TABLE
-- =====================================

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other'),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255),
    license_number VARCHAR(30) UNIQUE NOT NULL
);

-- =====================================
-- 2. VEHICLE TABLE
-- =====================================

CREATE TABLE vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_number VARCHAR(20) UNIQUE NOT NULL,
    vehicle_type VARCHAR(30),
    brand VARCHAR(50),
    model VARCHAR(50),
    manufacture_year YEAR,
    chassis_number VARCHAR(50) UNIQUE,
    engine_number VARCHAR(50) UNIQUE,

    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
    ON DELETE CASCADE
);

-- =====================================
-- 3. INSURANCE POLICY TABLE
-- =====================================

CREATE TABLE insurance_policy (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    policy_number VARCHAR(30) UNIQUE NOT NULL,
    policy_type ENUM('Comprehensive','Third Party','Own Damage'),
    start_date DATE,
    end_date DATE,
    premium_amount DECIMAL(10,2),
    coverage_amount DECIMAL(12,2),
    status ENUM('Active','Expired','Cancelled'),

    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle(vehicle_id)
    ON DELETE CASCADE
);

-- =====================================
-- 4. PAYMENT TABLE
-- =====================================

CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method ENUM('Cash','UPI','Credit Card','Debit Card','Net Banking'),
    payment_status ENUM('Paid','Pending','Failed'),

    FOREIGN KEY (policy_id)
    REFERENCES insurance_policy(policy_id)
    ON DELETE CASCADE
);

-- =====================================
-- 5. CLAIM DETAILS TABLE
-- =====================================

CREATE TABLE claim_details (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT NOT NULL,
    claim_date DATE,
    claim_amount DECIMAL(10,2),
    claim_status ENUM('Pending','Approved','Rejected'),
    description TEXT,

    FOREIGN KEY (policy_id)
    REFERENCES insurance_policy(policy_id)
    ON DELETE CASCADE
);

-- =====================================
-- 6. AGENT TABLE
-- =====================================

CREATE TABLE agent (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    branch VARCHAR(100)
);
