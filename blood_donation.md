# 📁 Blood Donation SQL Queries

This SQL file contains the full set of queries used for data extraction, validation, and analysis in the **Blood Donation Management System**. Queries are grouped by use case to reflect real-world scenarios a Business Analyst might face in a healthcare or public service environment.

## 1. 🧾 Basic SELECT & Filtering

```sql
-- 1.1. Write a SQL query to list all hospitals that have a blood bank.
SELECT
  hospital_name,
  location
FROM
  hospitals
WHERE
  has_blood_bank = true;

-- 1.2. Write a SQL query to find patients who require O+ blood.
SELECT
  first_name,
  last_name,
  disease
FROM
  patients
WHERE
  blood_group_required = 'O+';

-- 1.3. Write a SQL query to list all female donors.
SELECT
  first_name,
  last_name,
  blood_group
FROM
  donors
WHERE
  gender = 'Female';

-- 1.4. Write a SQL query to find patients admitted in the last 1 year.
SELECT
  first_name,
  last_name,
  admitted_date
FROM
  patients
WHERE
  admitted_date >= CURRENT_DATE - INTERVAL '1 year';

-- 1.5. Write a SQL query to find donors who registered with a Gmail address.
SELECT
  first_name,
  last_name,
  email
FROM
  donors
WHERE
  email LIKE '%@gmail.com';

-- 1.6. Write a SQL query to find hospitals in locations starting with 'D'.
SELECT
  hospital_name,
  location
FROM
  hospitals
WHERE
  location LIKE 'D%';

-- 1.7. Write a SQL query to find the top 5 oldest donors.
SELECT
  first_name,
  last_name,
  date_of_birth
FROM
  donors
ORDER BY
  date_of_birth ASC
LIMIT 5;
```

---

## 2. 🔗 JOINS & Relationships

```sql
-- 2.1. Write a SQL query to find the top 3 hospitals with the highest blood inventory.
SELECT
  h.hospital_name,
  SUM(b.units_available) AS total_units
FROM
  blood_inventory b
JOIN
  hospitals h ON b.hospital_id = h.hospital_id
GROUP BY
  h.hospital_name
ORDER BY
  total_units DESC
LIMIT 3;

-- 2.2. Write a SQL query to list donors and their total donation count.
SELECT
  d.first_name,
  d.last_name,
  r.total_donations
FROM
  donors d
JOIN
  rewards r ON d.donor_id = r.donor_id
ORDER BY
  r.total_donations DESC;

-- 2.3. Write a SQL query to count donations made to each hospital.
SELECT
  h.hospital_name,
  COUNT(*) AS donation_count
FROM
  donations d
JOIN
  hospitals h ON d.hospital_id = h.hospital_id
GROUP BY
  h.hospital_name
ORDER BY
  donation_count DESC;

-- 2.4. Write a SQL query to list patients with the hospitals they’re admitted to.
SELECT
  p.first_name,
  p.last_name,
  h.hospital_name,
  h.location
FROM
  patients p
JOIN
  hospitals h ON p.hospital_id = h.hospital_id;

-- 2.5. Write a SQL query to summarize total blood received by each hospital.
SELECT
  h.hospital_name,
  SUM(d.quantity_ml) AS total_received
FROM
  hospitals h
JOIN
  donations d ON d.hospital_id = h.hospital_id
GROUP BY
  h.hospital_name
ORDER BY
  total_received DESC;

-- 2.6. Write a SQL query to find mismatches in donor blood group vs donation blood group.
SELECT
  d.donor_id,
  d.blood_group AS donor_bg,
  dn.blood_group AS donated_bg
FROM
  donors d
JOIN
  donations dn ON d.donor_id = dn.donor_id
WHERE
  d.blood_group != dn.blood_group;
```

## 3. 📊 Aggregations & Metrics

```sql
-- 3.1. Write a SQL query to count the number of donors by blood group.
SELECT
  blood_group,
  COUNT(*) AS number_of_donors
FROM
  donors
GROUP BY
  blood_group
ORDER BY
  number_of_donors DESC;

-- 3.2. Write a SQL query to show total units of blood available by blood group.
SELECT
  blood_group,
  SUM(units_available) AS total_units
FROM
  blood_inventory
GROUP BY
  blood_group
ORDER BY
  total_units DESC;

-- 3.3. Write a SQL query to show total quantity of blood donated by blood group.
SELECT
  blood_group,
  SUM(quantity_ml) AS total_donated
FROM
  donations
GROUP BY
  blood_group
ORDER BY
  total_donated DESC;

-- 3.4. Write a SQL query to show how many donors fall under each reward status.
SELECT
  reward_status,
  COUNT(*) AS donor_count
FROM
  rewards
GROUP BY
  reward_status
ORDER BY
  donor_count DESC;

-- 3.5. Write a SQL query to calculate average inventory per blood group.
SELECT
  blood_group,
  AVG(units_available) AS avg_inventory
FROM
  blood_inventory
GROUP BY
  blood_group;

-- 3.6. Write a SQL query to show total quantity donated per donor.
SELECT
  donor_id,
  SUM(quantity_ml) AS total_quantity
FROM
  donations
GROUP BY
  donor_id
ORDER BY
  total_quantity DESC;

-- 3.7. Write a SQL query to show the gender distribution of donors.
SELECT
  gender,
  COUNT(*) AS gender_distribution
FROM
  donors
GROUP BY
  gender;
```
### 4. Subqueries & Advanced Logic

```sql
-- 4.1. Write a SQL query to list hospitals with no blood inventory.
SELECT hospital_name
FROM hospitals
WHERE hospital_id NOT IN (
  SELECT DISTINCT hospital_id 
  FROM blood_inventory
);
```

```sql
-- 4.2. Write a SQL query to find donors who never received rewards.
SELECT first_name, last_name
FROM donors
WHERE donor_id NOT IN (
  SELECT donor_id 
  FROM rewards
);
```

```sql
-- 4.3. Write a SQL query to find blood groups that are not currently in inventory.
SELECT DISTINCT bg.blood_group
FROM (
  SELECT DISTINCT blood_group 
  FROM donors
) bg
WHERE bg.blood_group NOT IN (
  SELECT DISTINCT blood_group 
  FROM blood_inventory
);
```

### 5. Data Validation & Quality Checks

```sql
-- 5.1. Write a SQL query to find donors who haven't donated in the last 6 months.
SELECT first_name, last_name, last_donation_date
FROM donors
WHERE last_donation_date < CURRENT_DATE - INTERVAL '6 months';
```

```sql
-- 5.2. Write a SQL query to find donors who donated at more than one hospital.
SELECT donor_id, COUNT(DISTINCT hospital_id) AS hospital_count
FROM donations
GROUP BY donor_id
HAVING COUNT(DISTINCT hospital_id) > 1;
```

```sql
-- 5.3. Write a SQL query to find donors with at least 3 donations.
SELECT donor_id, COUNT(*) AS donation_count
FROM donations
GROUP BY donor_id
HAVING COUNT(*) >= 3;
```

```sql
-- 5.4. Write a SQL query to find the most recent donation per donor.
SELECT donor_id, MAX(donation_date) AS last_donation
FROM donations
GROUP BY donor_id;
```

### 6. Filters, Conditions & Flags

```sql
-- 6.1. Write a SQL query to list donations with quantity greater than 400ml.
SELECT donor_id, donation_date, quantity_ml
FROM donations
WHERE quantity_ml > 400;
```

```sql
-- 6.2. Write a SQL query to find all patients suffering from cancer.
SELECT first_name, last_name, admitted_date
FROM patients
WHERE disease = 'Cancer';
```

```sql
-- 6.3. Write a SQL query to find the number of donations per donor.
SELECT donor_id, COUNT(*) AS donation_count
FROM donations
GROUP BY donor_id
ORDER BY donation_count DESC;
```

📌 **Note:** Some queries may return no results due to the small sample dataset. This is intentional for testing edge cases and data quality handling.

🧠 **Use Case:** Designed for Business Analysts to explore SQL skills across filtering, joining, aggregating, validating, and using subqueries.

📁 File: `blood_donation_queries.sql`
✅ PostgreSQL Compatible
