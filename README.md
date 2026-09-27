# Blood-Donation-Management-System-Using-SQL

Blood Donation Management System using SQL is a database project designed to manage and analyze information related to donors, hospitals, blood banks, blood donations, and recipients. The project uses a relational database structure with primary and foreign key relationships to maintain data accuracy and consistency. SQL queries are used for data retrieval, joins, filtering, aggregation, subqueries, and views to generate meaningful information about blood donations and recipients.

Project Objectives
Manage donor information
Store hospital and blood bank details
Track blood donation records
Manage recipient information
Understand relationships between donors, donations, blood banks, hospitals, and recipients
Practice SQL joins and subqueries
Create SQL views for analytical reporting
Analyze blood donation and recipient information
Database Tables

The project contains five main tables:

1. Donor
Stores personal and blood-related information about donors. Each donor has a unique Donor_ID as the primary key.

2. Hospital
Stores information about hospitals, including hospital name, address, and contact number. Each hospital has a unique Hospital_ID.

3. BloodBank
Stores blood bank information and connects each blood bank with a hospital using Hospital_ID.

4. Donation
Records blood donation transactions and connects donors with blood banks. It stores donation date and blood quantity.

5. Recipient
Stores information about people who require blood and connects recipients with hospitals and donations.

ER Diagram

Entities:

Donor
Hospital
BloodBank
Donation
Recipient

Relationships:

Donor → Donation
Hospital → BloodBank
BloodBank → Donation
Hospital → Recipient
Donation → Recipient
SQL Joins

The project demonstrates different types of SQL joins.

INNER JOIN — Display donor and donation details
SELECT d.name,
       d.blood_group,
       dn.donation_date,
       dn.quantity
FROM Donor d
INNER JOIN Donation dn
ON d.donor_id = dn.donor_id;
LEFT JOIN — Display all donors along with their donation details
SELECT d.name,
       d.blood_group,
       dn.donation_date,
       dn.quantity
FROM Donor d
LEFT JOIN Donation dn
ON d.donor_id = dn.donor_id;
RIGHT JOIN — Display all hospitals and their blood banks
SELECT h.hospital_id,
       h.hospital_name,
       b.bloodbank_id,
       b.bank_name
FROM BloodBank b
RIGHT JOIN Hospital h
ON b.hospital_id = h.hospital_id;
FULL OUTER JOIN Concept — Display all donors and donations

MySQL does not directly support FULL OUTER JOIN, so LEFT JOIN and RIGHT JOIN can be combined using UNION.

SELECT d.donor_id,
       d.name,
       dn.donation_id,
       dn.donation_date,
       dn.quantity
FROM Donor d
LEFT JOIN Donation dn
ON d.donor_id = dn.donor_id

UNION

SELECT d.donor_id,
       d.name,
       dn.donation_id,
       dn.donation_date,
       dn.quantity
FROM Donor d
RIGHT JOIN Donation dn
ON d.donor_id = dn.donor_id;
Multiple JOINs — Display complete blood donation information
SELECT d.name AS donor_name,
       d.blood_group,
       b.bank_name,
       h.hospital_name,
       dn.donation_date,
       dn.quantity,
       r.name AS recipient_name,
       r.blood_group_needed
FROM Donor d
INNER JOIN Donation dn
ON d.donor_id = dn.donor_id
INNER JOIN BloodBank b
ON dn.bloodbank_id = b.bloodbank_id
INNER JOIN Hospital h
ON b.hospital_id = h.hospital_id
INNER JOIN Recipient r
ON dn.donation_id = r.donation_id;
Subqueries

The project includes subqueries for analytical questions such as:

Finding donors who donated more than the average quantity
SELECT d.name,
       dn.quantity
FROM Donor d
INNER JOIN Donation dn
ON d.donor_id = dn.donor_id
WHERE dn.quantity >
(
    SELECT AVG(quantity)
    FROM Donation
);
Finding the donor who donated the maximum quantity
SELECT name
FROM Donor
WHERE donor_id =
(
    SELECT donor_id
    FROM Donation
    WHERE quantity =
    (
        SELECT MAX(quantity)
        FROM Donation
    )
);
Finding hospitals that have a blood bank
SELECT hospital_name
FROM Hospital
WHERE hospital_id IN
(
    SELECT hospital_id
    FROM BloodBank
);
Finding donors who have made a donation
SELECT name
FROM Donor
WHERE donor_id IN
(
    SELECT donor_id
    FROM Donation
);
Finding recipients connected to donations greater than 400 ml
SELECT name,
       blood_group_needed
FROM Recipient
WHERE donation_id IN
(
    SELECT donation_id
    FROM Donation
    WHERE quantity > 400
);
SQL Views

Three analytical views are created in the project.

1. Donor Donation View

The Donor_Donation_View combines:

Donor ID
Donor Name
Blood Group
Donation Date
Quantity
CREATE VIEW Donor_Donation_View AS
SELECT
    d.donor_id,
    d.name AS donor_name,
    d.blood_group,
    dn.donation_date,
    dn.quantity
FROM Donor d
INNER JOIN Donation dn
ON d.donor_id = dn.donor_id;

To display the view:

SELECT * FROM Donor_Donation_View;

2. Hospital Blood Bank View

The Hospital_BloodBank_View provides:

Hospital ID
Hospital Name
Blood Bank ID
Blood Bank Name
Location
CREATE VIEW Hospital_BloodBank_View AS
SELECT
    h.hospital_id,
    h.hospital_name,
    b.bloodbank_id,
    b.bank_name,
    b.location
FROM Hospital h
INNER JOIN BloodBank b
ON h.hospital_id = b.hospital_id;

To display the view:

SELECT * FROM Hospital_BloodBank_View;
3. Recipient Hospital View

The Recipient_Hospital_View provides:

Recipient ID
Recipient Name
Required Blood Group
Hospital Name
Hospital Address
CREATE VIEW Recipient_Hospital_View AS
SELECT
    r.recipient_id,
    r.name AS recipient_name,
    r.blood_group_needed,
    h.hospital_name,
    h.address
FROM Recipient r
INNER JOIN Hospital h
ON r.hospital_id = h.hospital_id;

To display the view:

SELECT * FROM Recipient_Hospital_View;
📁 Project Files
Blood-Donation-Management-SQL

Project in SQL
< a href = "https://github.com/SaniyaPatil-1706/Blood-Donation-Management-System-Using-SQL/blob/main/SQLProject_BloodBankDonation.sql"> Blood Donar Management System In SQL </a>
Contains the database creation, table creation, records, joins, subqueries, and view creation statements used in the project.

SQL PPT 
<a href = "Blood-Donation-Management-System-Using-SQL/Blood Donation Management System.pptx at main · SaniyaPatil-1706/Blood-Donation-Management-System-Using-SQL">< Project PPT </a>
Contains the project presentation, database structure, ER diagram, table descriptions, SQL queries, and outputs.

Key Insights
Managed donor and recipient information using a relational database.
Tracked blood donations and donation quantities.
Connected hospitals with their respective blood banks.
Analyzed donor and donation information using SQL joins.
Identified donations above the average and maximum donation quantity using subqueries.
Connected recipients with hospitals and donation records.
Created SQL views for donor, hospital, blood bank, and recipient analysis.
Maintained data consistency using primary keys and foreign key relationships.
