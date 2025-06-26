# 🩸 Blood Donation Management System (SQL Project)

## 📌 Project Overview

**Project Title**: Blood Donation Management System  
**Level**: Beginner – Intermediate  
**Database**: `blood_donation_db`

This SQL project simulates a real-world system for managing blood donations across hospitals, donors, patients, and inventory. It mirrors how Business Analysts work with healthcare data to track donations, manage inventory, validate blood types, and report on donor engagement and hospital needs.

## 💡 Why This Project Matters

This project reflects common BA use cases in healthcare, operations, and data governance. It demonstrates:  
- How to extract insights from medical and donor data  
- How to validate and manage critical inventory records  
- My ability to query, clean, and analyze structured healthcare datasets using SQL  

## 🎯 Objectives

- Design clean, joinable hospital and blood donation datasets  
- Practice real-world SQL queries: JOIN, GROUP BY, CASE, filtering, subqueries, validation  
- Derive insights from donation, inventory, and patient data  

## 🏗️ Project Structure

### 1. Database Setup  
**Database Name**: `blood_donation_db`  
- Built using PostgreSQL to simulate hospital and donor workflows

### 2. Table Creation

Six core tables represent donation operations:

```sql
1. Hospitals Table
CREATE TABLE hospitals (
  hospital_id SERIAL PRIMARY KEY,
  hospital_name VARCHAR(100),
  location VARCHAR(100),
  contact_number VARCHAR(20),
  has_blood_bank BOOLEAN);

2. Donors Table
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
  last_donation_date DATE);

3. Patients Table
CREATE TABLE patients (
  patient_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  blood_group_required VARCHAR(5),
  disease VARCHAR(100),
  hospital_id INT REFERENCES hospitals(hospital_id),
  admitted_date DATE);

4. Blood Inventory Table
CREATE TABLE blood_inventory (
  inventory_id SERIAL PRIMARY KEY,
  hospital_id INT REFERENCES hospitals(hospital_id),
  blood_group VARCHAR(5),
  units_available INT,
  last_updated DATE);

5. Donations Table
CREATE TABLE donations (
  donation_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES donors(donor_id),
  hospital_id INT REFERENCES hospitals(hospital_id),
  donation_date DATE,
  blood_group VARCHAR(5),
  quantity_ml INT);

6. Rewards Table
CREATE TABLE rewards (
  reward_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES donors(donor_id),
  total_donations INT,
  last_reward_date DATE,
  reward_status VARCHAR(50));
```

### 📊 SQL Queries for Business Analysts
The full list of 30+ real-world queries is saved in [blood_donation](https://github.com/shayisthaabdulla/Blood_Donation_SQL_Project/blob/main/blood_donation.md) covering:

- ✅ Basic SELECT & Filtering
- 🔗 JOINs & Relationships
- 📊 Aggregations & Metrics
- 🧹 Data Validation & Quality
- 🧠 Subqueries & CASE Logic
- ⏳ Time-Based and Flag-Based Filters

⚠️ Note: Some queries may return no results due to the small sample dataset. This was intentional to simulate edge cases and teach how to validate data even when results are missing — a key task for real-world BAs.

### 📈 Key Findings

- Donation quantities and hospital-level contributions were visualized using grouping and totals  
- Reward eligibility trends were extracted based on total donations and reward status  
- Data validation queries helped detect mismatches or missing inventory, though results may vary with small data  
- Queries were designed to simulate real validation scenarios, even if no issues are found in the sample

### 📋 Reporting Extensions
- Donor Activity & Reward Dashboard
- Blood Group Shortage Risk Tracker
- Monthly Donation Trend Chart
- Hospital-Wise Blood Inventory Overview

### 👩‍💼 About the Author
Microsoft Certified Dynamics 365 professional, Shayistha Abdulla is a Business Analyst with 9+ years of experience across Digital Marketing, CRM, PropTech, and IT Consulting. This project demonstrates her SQL skills applied to healthcare and public service domains, with a focus on data analysis, validation, and stakeholder reporting.

📫 [Connect on LinkedIn](https://www.linkedin.com/in/shayisthaa/)
