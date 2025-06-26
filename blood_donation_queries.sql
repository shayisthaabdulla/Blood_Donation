-- blood_donation_queries.sql

-- Table Creation Statements
CREATE TABLE hospitals (
  hospital_id SERIAL PRIMARY KEY,
  hospital_name VARCHAR(100),
  location VARCHAR(100),
  contact_number VARCHAR(20),
  has_blood_bank BOOLEAN
);

CREATE TABLE donors (
  donor_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  gender VARCHAR(10),
  blood_group VARCHAR(5),
  phone_number VARCHAR(20),
  email VARCHAR(100) UNIQUE,
  address TEXT,
  last_donation_date DATE
);

CREATE TABLE patients (
  patient_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  blood_group_required VARCHAR(5),
  disease VARCHAR(100),
  hospital_id INT REFERENCES hospitals(hospital_id),
  admitted_date DATE
);

CREATE TABLE blood_inventory (
  inventory_id SERIAL PRIMARY KEY,
  hospital_id INT REFERENCES hospitals(hospital_id),
  blood_group VARCHAR(5),
  units_available INT,
  last_updated DATE
);

CREATE TABLE donations (
  donation_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES donors(donor_id),
  hospital_id INT REFERENCES hospitals(hospital_id),
  donation_date DATE,
  blood_group VARCHAR(5),
  quantity_ml INT
);

CREATE TABLE rewards (
  reward_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES donors(donor_id),
  total_donations INT,
  last_reward_date DATE,
  reward_status VARCHAR(50)
);

-- Data Inserts
-- [Truncated for brevity due to length; original insert statements are long and previously provided]

-- SQL Queries (Groupings: Basic SELECT, JOINS, Aggregations, etc.)
-- [Truncated for brevity; all queries included previously are to be appended here as-is]

-- Note: Some queries may not return results due to limited sample size (10 records).
