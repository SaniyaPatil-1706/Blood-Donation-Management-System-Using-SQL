CREATE DATABASE BloodDonationDB;
USE BloodDonationDB;
-- Donar table
CREATE TABLE Donor (
    donor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    blood_group VARCHAR(5),
    phone VARCHAR(15),
    city VARCHAR(50)
);
desc donor;
-- Hospital
CREATE TABLE Hospital (
    hospital_id VARCHAR(10) PRIMARY KEY,
    hospital_name VARCHAR(100),
    address VARCHAR(100),
    phone VARCHAR(15)
);
desc hospital;
-- BloodBank
CREATE TABLE BloodBank (
    bloodbank_id VARCHAR(10) PRIMARY KEY,
    hospital_id VARCHAR(10),
    bank_name VARCHAR(100),
    location VARCHAR(100),
    FOREIGN KEY (hospital_id)
    REFERENCES Hospital(hospital_id)
);
desc bloodbank;
-- Donation
CREATE TABLE Donation (
    donation_id VARCHAR(10) PRIMARY KEY,
    donor_id VARCHAR(10),
    bloodbank_id VARCHAR(10),
    donation_date DATE,
    quantity INT,
    FOREIGN KEY (donor_id)
    REFERENCES Donor(donor_id),
    FOREIGN KEY (bloodbank_id)
    REFERENCES BloodBank(bloodbank_id)
);
desc donation;
-- Recipient
CREATE TABLE Recipient (
    recipient_id VARCHAR(10) PRIMARY KEY,
    hospital_id VARCHAR(10),
    donation_id VARCHAR(10),
    name VARCHAR(50),
    blood_group_needed VARCHAR(5),
    phone VARCHAR(15),
    FOREIGN KEY (hospital_id)
    REFERENCES Hospital(hospital_id),
    FOREIGN KEY (donation_id)
    REFERENCES Donation(donation_id)
);
desc recipient;
INSERT INTO Donor VALUES
('D101','Amit Sharma','A+','9876500001','Mumbai'),
('D102','Priya Patil','B+','9876500002','Pune'),
('D103','Rahul Verma','O+','9876500003','Nashik'),
('D104','Sneha Joshi','AB+','9876500004','Thane'),
('D105','Rohan Singh','A-','9876500005','Kalyan'),
('D106','Pooja Mehta','O-','9876500006','Nagpur'),
('D107','Karan Gupta','B-','9876500007','Aurangabad'),
('D108','Neha Kulkarni','A+','9876500008','Ambernath'),
('D109','Ajay Kumar','O+','9876500009','Dombivli'),
('D110','Anita Desai','AB-','9876500010','Mumbai'),
('D111','Raj Patil','A+','9876500011','Pune'),
('D112','Komal Shah','B+','9876500012','Panvel'),
('D113','Suresh Yadav','O+','9876500013','Thane'),
('D114','Riya Jain','AB+','9876500014','Navi Mumbai'),
('D115','Vikas Chavan','A-','9876500015','Ulhasnagar'),
('D116','Nisha More','B-','9876500016','Badlapur'),
('D117','Arjun Naik','O-','9876500017','Karjat'),
('D118','Meena Pawar','A+','9876500018','Lonavala'),
('D119','Deepak Mishra','B+','9876500019','Satara'),
('D120','Sanjay Rao','O+','9876500020','Kolhapur'),
('D121','Rekha Patwardhan','AB+','9876500021','Solapur'),
('D122','Kishor Sawant','A+','9876500022','Ratnagiri'),
('D123','Jyoti Nair','O-','9876500023','Sindhudurg'),
('D124','Manoj Shinde','B+','9876500024','Palghar'),
('D125','Seema Patil','A+','9876500025','Jalgaon');

INSERT INTO Hospital VALUES
('H101','City Hospital','Mumbai','9000000001'),
('H102','Apollo Hospital','Pune','9000000002'),
('H103','Fortis Hospital','Thane','9000000003'),
('H104','Ruby Hall Hospital','Pune','9000000004'),
('H105','Jupiter Hospital','Thane','9000000005'),
('H106','Civil Hospital','Nashik','9000000006'),
('H107','Global Hospital','Mumbai','9000000007'),
('H108','Sunrise Hospital','Nagpur','9000000008'),
('H109','Lifeline Hospital','Kalyan','9000000009'),
('H110','Care Hospital','Panvel','9000000010'),
('H111','Metro Hospital','Aurangabad','9000000011'),
('H112','Lotus Hospital','Ambernath','9000000012'),
('H113','Unity Hospital','Dombivli','9000000013'),
('H114','Hope Hospital','Badlapur','9000000014'),
('H115','Shree Hospital','Karjat','9000000015'),
('H116','Sai Hospital','Ulhasnagar','9000000016'),
('H117','General Hospital','Lonavala','9000000017'),
('H118','Wellness Hospital','Satara','9000000018'),
('H119','Health Care Hospital','Kolhapur','9000000019'),
('H120','People Hospital','Ratnagiri','9000000020'),
('H121','Prime Hospital','Palghar','9000000021'),
('H122','Apex Hospital','Jalgaon','9000000022'),
('H123','Galaxy Hospital','Solapur','9000000023'),
('H124','Om Hospital','Sindhudurg','9000000024'),
('H125','Life Care Hospital','Navi Mumbai','9000000025');

-- blood bank
INSERT INTO BloodBank VALUES
('BB101','H101','City Blood Bank','Mumbai'),
('BB102','H102','Apollo Blood Bank','Pune'),
('BB103','H103','Fortis Blood Bank','Thane'),
('BB104','H104','Ruby Blood Bank','Pune'),
('BB105','H105','Jupiter Blood Bank','Thane'),
('BB106','H106','Civil Blood Bank','Nashik'),
('BB107','H107','Global Blood Bank','Mumbai'),
('BB108','H108','Sunrise Blood Bank','Nagpur'),
('BB109','H109','Lifeline Blood Bank','Kalyan'),
('BB110','H110','Care Blood Bank','Panvel'),
('BB111','H111','Metro Blood Bank','Aurangabad'),
('BB112','H112','Lotus Blood Bank','Ambernath'),
('BB113','H113','Unity Blood Bank','Dombivli'),
('BB114','H114','Hope Blood Bank','Badlapur'),
('BB115','H115','Shree Blood Bank','Karjat'),
('BB116','H116','Sai Blood Bank','Ulhasnagar'),
('BB117','H117','General Blood Bank','Lonavala'),
('BB118','H118','Wellness Blood Bank','Satara'),
('BB119','H119','Health Care Blood Bank','Kolhapur'),
('BB120','H120','People Blood Bank','Ratnagiri'),
('BB121','H121','Prime Blood Bank','Palghar'),
('BB122','H122','Apex Blood Bank','Jalgaon'),
('BB123','H123','Galaxy Blood Bank','Solapur'),
('BB124','H124','Om Blood Bank','Sindhudurg'),
('BB125','H125','Life Care Blood Bank','Navi Mumbai');

-- donation
INSERT INTO Donation VALUES
('DN101','D101','BB101','2026-01-01',450),
('DN102','D102','BB102','2026-01-02',350),
('DN103','D103','BB103','2026-01-03',400),
('DN104','D104','BB104','2026-01-04',450),
('DN105','D105','BB105','2026-01-05',350),
('DN106','D106','BB106','2026-01-06',400),
('DN107','D107','BB107','2026-01-07',450),
('DN108','D108','BB108','2026-01-08',350),
('DN109','D109','BB109','2026-01-09',400),
('DN110','D110','BB110','2026-01-10',450),
('DN111','D111','BB111','2026-01-11',350),
('DN112','D112','BB112','2026-01-12',400),
('DN113','D113','BB113','2026-01-13',450),
('DN114','D114','BB114','2026-01-14',350),
('DN115','D115','BB115','2026-01-15',400),
('DN116','D116','BB116','2026-01-16',450),
('DN117','D117','BB117','2026-01-17',350),
('DN118','D118','BB118','2026-01-18',400),
('DN119','D119','BB119','2026-01-19',450),
('DN120','D120','BB120','2026-01-20',350),
('DN121','D121','BB121','2026-01-21',400),
('DN122','D122','BB122','2026-01-22',450),
('DN123','D123','BB123','2026-01-23',350),
('DN124','D124','BB124','2026-01-24',400),
('DN125','D125','BB125','2026-01-25',450);

-- recipitent
INSERT INTO Recipient VALUES
('R101','H101','DN101','Ramesh Sharma','A+','9999000001'),
('R102','H102','DN102','Anjali Patil','B+','9999000002'),
('R103','H103','DN103','Mohit Verma','O+','9999000003'),
('R104','H104','DN104','Sneha Joshi','AB+','9999000004'),
('R105','H105','DN105','Vijay Singh','A-','9999000005'),
('R106','H106','DN106','Ritu Mehta','O-','9999000006'),
('R107','H107','DN107','Harsh Gupta','B-','9999000007'),
('R108','H108','DN108','Nikita Shah','A+','9999000008'),
('R109','H109','DN109','Akash Kumar','O+','9999000009'),
('R110','H110','DN110','Kajal Desai','AB-','9999000010'),
('R111','H111','DN111','Rohan Kulkarni','A+','9999000011'),
('R112','H112','DN112','Megha Nair','B+','9999000012'),
('R113','H113','DN113','Kiran Pawar','O+','9999000013'),
('R114','H114','DN114','Bhavna Jain','AB+','9999000014'),
('R115','H115','DN115','Ravi Chavan','A-','9999000015'),
('R116','H116','DN116','Nitin More','B-','9999000016'),
('R117','H117','DN117','Sapna Yadav','O-','9999000017'),
('R118','H118','DN118','Pankaj Mishra','A+','9999000018'),
('R119','H119','DN119','Kavita Rao','B+','9999000019'),
('R120','H120','DN120','Sahil Khan','O+','9999000020'),
('R121','H121','DN121','Divya Patwardhan','AB+','9999000021'),
('R122','H122','DN122','Rakesh Naik','A+','9999000022'),
('R123','H123','DN123','Monika Das','O-','9999000023'),
('R124','H124','DN124','Aarti Kulkarni','B+','9999000024'),
('R125','H125','DN125','Sameer Patil','A+','9999000025');

select * from donor;
select * from hospital;
select * from BloodBank;
select * from donation;
select * from recipient;


-- joins
-- Display donor name and donation details.
Select d.name, d.blood_group, dn.donation_date, dn.quantity
From Donor d
Inner join Donation dn
on d.donor_id = dn.donor_id;

-- Q.2 
Select h.hospital_name, b.bank_name, b.location
From Hospital h
inner join BloodBank b
On h.hospital_id = b.hospital_id;

-- Q.3 Display donor and blood bank details
Select d.name as Donor_Name, d.blood_group,  b.bank_name as
Blood_Bank, dn.donation_date, dn.quantity 
From  Donor d
inner join Donation dn
on d.donor_id = dn.donor_id
inner join bloodbank b
on dn.bloodbank_id = b.bloodbank_id;

-- Q.4 Display recipient and hospital details
SELECT r.name AS Recipient_Name,
       r.blood_group_needed,
       h.hospital_name,
       h.address
FROM Recipient r
INNER JOIN Hospital h
ON r.hospital_id = h.hospital_id;

-- Q.5 Display complete blood donation information
SELECT d.name AS Donor_Name,
       d.blood_group AS Donor_Blood_Group,
       b.bank_name AS Blood_Bank,
       dn.donation_date,
       dn.quantity,
       r.name AS Recipient_Name,
       r.blood_group_needed
FROM Donor d
INNER JOIN Donation dn
ON d.donor_id = dn.donor_id
INNER JOIN BloodBank b
ON dn.bloodbank_id = b.bloodbank_id
INNER JOIN Recipient r
ON dn.donation_id = r.donation_id;

-- Sub Quries
-- Q.1 Find the donor who donated the maximum quantity of blood
SELECT name FROM Donor WHERE donor_id IN (
    SELECT donor_id FROM Donation WHERE quantity = (
        SELECT MAX(quantity) FROM Donation ) );
        
-- Q.2 Display donors with blood group A+
select name from donor where donor_id in (
    select donor_id from donation )
and blood_group = 'A+';

-- Q.3 Find hospitals that have blood banks in Mumbai
 select hospital_name from hospital
where hospital_id IN (
    select hospital_id from BloodBank
    where location = 'Mumbai' );
    
-- Find donors who have donated blood
select name from donor
where donor_id in (
    select donor_id from donation );

-- Q.5 Find recipients who received blood from donations greater than 400 ml
	select name, blood_group_needed
from recipient where donation_id in (
    select donation_id from donation
    where quantity > 400 );


-- Views
-- Q.1 Create a View to Display Donor Donation Details
	create view donordonationview as
select d.name, d.blood_group,
       dn.donation_date, dn.quantity
from donor d
inner join donation dn
on d.donor_id = dn.donor_id;

SELECT * FROM DonorDonationView;

-- Q.2 Create a View to Display Hospital and Blood Bank Details
create view hospitalbloodbankview as
select h.hospital_name, b.bank_name,
       b.location from hospital h
inner join bloodbank b
on h.hospital_id = b.hospital_id;

select * from hospitalbloodbankview;

-- Q.3 Create a View to Display Recipient and Hospital Details
create view recipienthospitalview as
select r.name as recipient_name, 
r.blood_group_needed, h.hospital_name
from recipient r inner join hospital h
on r.hospital_id = h.hospital_id;
select * from recipienthospitalview;