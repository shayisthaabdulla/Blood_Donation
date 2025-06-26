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

INSERT INTO hospitals (hospital_name, location, contact_number, has_blood_bank) VALUES
('Greenwood Medical Center', 'Austin', '512-555-1234', true),
('Sunrise Health', 'Dallas', '214-555-5678', true),
('Metro General Hospital', 'Houston', '713-555-2345', false),
('Lakeside Clinic', 'San Antonio', '210-555-8765', true),
('Wellness Hospital', 'El Paso', '915-555-4321', true),
('Silverline Medical', 'Plano', '469-555-1122', false),
('Hope Health Center', 'Irving', '972-555-3344', true),
('Harmony Hospital', 'Frisco', '469-555-5566', true),
('Westend Medical Hub', 'Lubbock', '806-555-7788', false),
('River Valley Hospital', 'McAllen', '956-555-9900', true);

INSERT INTO donors (first_name, last_name, date_of_birth, gender, blood_group, phone_number, email, address, last_donation_date) VALUES
('Clinton', 'Hopkins', '1983-08-04', 'Male', 'A+', '555-123-4567', 'clinton.hopkins@example.com', '123 Oak St, Austin, TX', '2024-02-15'),
('Maya', 'Singh', '1990-03-21', 'Female', 'O-', '555-234-5678', 'maya.singh@example.com', '456 Maple Rd, Dallas, TX', '2024-03-10'),
('Jose', 'Martinez', '1978-12-01', 'Male', 'B+', '555-345-6789', 'jose.martinez@example.com', '789 Pine Ln, Houston, TX', '2024-01-20'),
('Anna', 'Chen', '1985-06-12', 'Female', 'AB+', '555-456-7890', 'anna.chen@example.com', '321 Elm St, San Antonio, TX', '2024-02-01'),
('David', 'Nguyen', '1995-11-05', 'Male', 'O+', '555-567-8901', 'david.nguyen@example.com', '654 Spruce Ave, El Paso, TX', '2024-01-15'),
('Sara', 'Ali', '1989-10-10', 'Female', 'A-', '555-678-9012', 'sara.ali@example.com', '987 Cedar Dr, Plano, TX', '2024-02-22'),
('Mohammed', 'Ibrahim', '1993-07-30', 'Male', 'B-', '555-789-0123', 'mohammed.ibrahim@example.com', '432 Birch St, Irving, TX', '2024-03-05'),
('Leila', 'Khan', '1987-04-18', 'Female', 'AB-', '555-890-1234', 'leila.khan@example.com', '876 Chestnut Blvd, Frisco, TX', '2024-03-12'),
('Emily', 'Jones', '1992-09-25', 'Female', 'O+', '555-901-2345', 'emily.jones@example.com', '135 Willow Way, Lubbock, TX', '2024-01-30'),
('Ahmed', 'Farah', '1980-01-14', 'Male', 'A+', '555-012-3456', 'ahmed.farah@example.com', '246 Cypress Ct, McAllen, TX', '2024-02-28');


INSERT INTO patients (first_name, last_name, blood_group_required, disease, hospital_id, admitted_date) VALUES
('Raj', 'Patel', 'O+', 'Anemia', 1, '2024-02-20'),
('Jessica', 'Brown', 'A-', 'Surgery', 2, '2024-03-01'),
('Mohammed', 'Zahid', 'B+', 'Accident', 3, '2024-01-15'),
('Emily', 'White', 'AB+', 'Cancer', 4, '2024-02-10'),
('Carlos', 'Ramirez', 'O-', 'Surgery', 5, '2024-03-05'),
('Fatima', 'Malik', 'A+', 'Anemia', 6, '2024-03-15'),
('John', 'Doe', 'B-', 'Accident', 7, '2024-01-25'),
('Amira', 'Suleiman', 'O+', 'Cancer', 8, '2024-02-18'),
('Olivia', 'Stone', 'AB-', 'Surgery', 9, '2024-02-28'),
('Ali', 'Nasser', 'A-', 'Anemia', 10, '2024-03-08');

INSERT INTO blood_inventory (hospital_id, blood_group, units_available, last_updated) VALUES
(1, 'A+', 12, '2024-03-01'),
(2, 'O-', 8, '2024-03-02'),
(3, 'B+', 15, '2024-02-28'),
(4, 'AB+', 10, '2024-03-03'),
(5, 'O+', 7, '2024-03-01'),
(6, 'A-', 5, '2024-02-27'),
(7, 'B-', 6, '2024-02-25'),
(8, 'AB-', 4, '2024-02-26'),
(9, 'O+', 10, '2024-02-28'),
(10, 'A+', 9, '2024-03-02');

INSERT INTO donations (donor_id, hospital_id, donation_date, blood_group, quantity_ml) VALUES
(1, 1, '2024-02-15', 'A+', 450),
(2, 2, '2024-03-10', 'O-', 350),
(3, 3, '2024-01-20', 'B+', 450),
(4, 4, '2024-02-01', 'AB+', 450),
(5, 5, '2024-01-15', 'O+', 250),
(6, 6, '2024-02-22', 'A-', 350),
(7, 7, '2024-03-05', 'B-', 450),
(8, 8, '2024-03-12', 'AB-', 350),
(9, 9, '2024-01-30', 'O+', 250),
(10, 10, '2024-02-28', 'A+', 450);

INSERT INTO rewards (donor_id, total_donations, last_reward_date, reward_status) VALUES
(1, 5, '2024-02-20', 'Eligible'),
(2, 8, '2024-03-11', 'Redeemed'),
(3, 3, '2024-01-25', 'Eligible'),
(4, 4, '2024-02-10', 'Not Eligible'),
(5, 6, '2024-02-05', 'Eligible'),
(6, 9, '2024-02-28', 'Redeemed'),
(7, 2, '2024-03-06', 'Eligible'),
(8, 7, '2024-03-14', 'Eligible'),
(9, 5, '2024-02-01', 'Not Eligible'),
(10, 10, '2024-03-01', 'Eligible');

--1.Basic SELECT & Filtering--

--1.1.Write a SQL query to list all hospitals that have a blood bank.--

SELECT hospital_name,location
FROM hospitals
WHERE has_blood_bank = 'true';

--1.2.Write a SQL query to find patients who require O+ blood.--

SELECT first_name,last_name,disease
FROM patients
WHERE blood_group_required='O+';

--1.3.Write a SQL query to list all female donors.--

SELECT first_name,last_name,blood_group
FROM donors
WHERE gender='Female';

--1.4.Write a SQL query to find patients admitted in the last 1 year.--

SELECT first_name, last_name, admitted_date
FROM patients
WHERE admitted_date <= CURRENT_DATE - INTERVAL '365 days';

--1.5.Write a SQL query to find donors who registered with a Gmail address.--

SELECT first_name,last_name,email
FROM donors
WHERE EMAIL LIKE '%@gmail.com'

--1.6.Write a SQL query to find hospitals in locations starting with 'D'.--

SELECT hospital_name,location
FROM hospitals
WHERE location LIKE 'D%';

--1.7.Write a SQL query to find the top 5 oldest donors.--

SELECT first_name,last_name,date_of_birth
FROM donors
ORDER BY date_of_birth DESC
LIMIT 5;

--2. JOINS & RELATIONSHIPS--
--2.1.Write a SQL query to find the top 3 hospitals with the highest blood inventory.--

SELECT h.hospital_name, SUM(b.units_available) AS total_units
FROM blood_inventory b
JOIN hospitals h ON b.hospital_id = h.hospital_id
GROUP BY h.hospital_name
ORDER BY total_units DESC
LIMIT 3;

--2.2.Write a SQL query to list donors and their total donation count.--

SELECT d.first_name,d.last_name,r.total_donations
FROM donors AS d
JOIN rewards AS r
ON d.donor_id=r.donor_id
ORDER BY r.total_donations DESC;

--2.3.Write a SQL query to count donations made to each hospital.--

SELECT h.hospital_name, COUNT (*) AS donation_count
FROM donations AS d
JOIN hospitals AS h
ON d.hospital_id=h.hospital_id
GROUP BY h.hospital_name
ORDER BY donation_count

--2.4.Write a SQL query to list patients with the hospitals they’re admitted to.--

SELECT p.first_name,p.last_name,h.hospital_name,h.location
FROM patients AS p
JOIN hospitals AS h
ON p.hospital_id=h.hospital_id

--2.5.Write a SQL query to summarize total blood received by each hospital.--

SELECT h.hospital_name, SUM(d.quantity_ml) AS total_received
FROM hospitals AS h
JOIN donations AS d
ON d.hospital_id=h.hospital_id
GROUP BY h.hospital_name
ORDER by total_received DESC

--2.6.Write a SQL query to find mismatches in donor blood group vs donation blood group.--

SELECT d.donor_id, d.blood_group AS donor_bg, dn.blood_group AS donated_bg
FROM donors d
JOIN donations dn ON d.donor_id = dn.donor_id
WHERE d.blood_group != dn.blood_group;

--3. Aggregations & Metrics--
--3.1.Write a SQL query to count the number of donors by blood group.--

SELECT blood_group, COUNT (*) AS number_of_donors
FROM donors
GROUP BY blood_group
ORDER BY number_of_donors DESC;

--3.2.Write a SQL query to show total units of blood available by blood group.--

SELECT blood_group, SUM(units_available) AS total_units
FROM blood_inventory
GROUP BY blood_group
ORDER BY total_units DESC;

--3.3.Write a SQL query to show total quantity of blood donated by blood group.--

SELECT blood_group, SUM(quantity_ml) AS total_donated
FROM donations
GROUP BY blood_group 
ORDER BY total_donated DESC;

--3.4.Write a SQL query to show how many donors fall under each reward status.--

SELECT reward_status, COUNT(total_donations) AS donor_count
FROM rewards
GROUP BY reward_status
ORDER BY donor_count DESC;

--3.5.Write a SQL query to calculate average inventory per blood group.--

SELECT blood_group, AVG(units_available) AS avg_inventory
FROM blood_inventory
GROUP BY blood_group;

--3.6.Write a SQL query to show total quantity donated per donor.--

SELECT donor_id, SUM(quantity_ml) AS total_quantity
FROM donations
GROUP BY donor_id
ORDER BY total_quantity DESC;

--3.7.Write a SQL query to show the gender distribution of donors--

SELECT gender, COUNT (*) AS gender_distribution
FROM donors
GROUP BY gender;

--4. Subqueries & Advanced Logic--

--4.1.Write a SQL query to list hospitals with no blood inventory.--

SELECT hospital_name
FROM hospitals
WHERE hospital_id NOT IN (
  SELECT DISTINCT hospital_id FROM blood_inventory
);

--4.2.Write a SQL query to find donors who never received rewards.--

SELECT first_name, last_name
FROM donors
WHERE donor_id NOT IN (SELECT donor_id FROM rewards);

--4.3.Write a SQL query to find blood groups that are not currently in inventory.--

SELECT DISTINCT bg.blood_group
FROM (SELECT DISTINCT blood_group FROM donors) bg
WHERE bg.blood_group NOT IN (SELECT DISTINCT blood_group FROM blood_inventory);


--5.Data Validation & Quality Checks--

--5.1.Write a SQL query to find donors who haven't donated in the last 6 months.--

SELECT first_name,last_name,last_donation_date
FROM donors
WHERE last_donation_date < CURRENT_DATE-INTERVAL '6 MONTHS';


--5.2.Write a SQL query to find donors who donated at more than one hospital.--

SELECT donor_id, COUNT(DISTINCT hospital_id) AS hospital_count
FROM donations
GROUP BY donor_id
HAVING COUNT(DISTINCT hospital_id) > 1;

--5.3.Write a SQL query to find donors with at least 3 donations.--

SELECT donor_id, COUNT(*) AS donation_count
FROM donations
GROUP BY donor_id
HAVING COUNT(*) >= 3;

--5.4.Write a SQL query to find the most recent donation per donor.--

SELECT donor_id, MAX(donation_date) AS last_donation
FROM donations
GROUP BY donor_id;

--6. FILTERS, CONDITIONS & FLAGS--

--6.1.Write a SQL query to list donations with quantity greater than 400ml.--

SELECT donor_id,donation_date,quantity_ml
FROM donations
WHERE quantity_ml>400;

--6.2.Write a SQL query to find all patients suffering from cancer.--

SELECT first_name,last_name,admitted_date
FROM patients
WHERE disease='Cancer';

--6.3.Write a SQL query to find the number of donations per donor.--

SELECT donor_id, COUNT(*) AS donation_count
FROM donations
GROUP BY donor_id
ORDER BY donation_count DESC;



