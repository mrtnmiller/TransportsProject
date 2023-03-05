/*----------------------- CREATING A DATABASE ----------------*/


CREATE DATABASE logistics;
USE logistics;


/*----------------------- CREATING TABLES --------------------*/

-- Let's create 4 tables and set the data types, primary and foreign keys.


CREATE TABLE transports (
						transport_id INT,
                        transport_type VARCHAR(50),
                        departure_date DATE,
                        destination_country VARCHAR(50),
                        destination_city VARCHAR(50),
                        distance_km INT,
                        customer_id INT,
                        vehicle_id INT,
                        driver_id INT,
                        load_weight_kg INT,
                        number_of_palets INT,
                        transit_time_hours DECIMAL(5,2),
                        fuel_price DECIMAL(5,2),
                        PRIMARY KEY (transport_id),
                        FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
                        FOREIGN KEY (vehicle_id) REFERENCES vehicles (vehicle_id),
                        FOREIGN KEY (driver_id) REFERENCES drivers (driver_id)
                        );
                        
CREATE TABLE drivers   (
						driver_id INT,
                        first_name VARCHAR(50),
                        last_name VARCHAR(50),
                        phone_number INT,
                        salary_per_km DECIMAL(5,3),
                        PRIMARY KEY (driver_id)
                        );
                        
CREATE TABLE vehicles  (
						vehicle_id INT AUTO_INCREMENT,
                        plate_number VARCHAR(50),
                        vehicle_type VARCHAR(50),
                        maker VARCHAR(50),
                        model VARCHAR(50),
                        year YEAR,
                        PRIMARY KEY (vehicle_id)
                        );
                        
CREATE TABLE customers (
						customer_id INT,
                        customer_name VARCHAR(50),
                        euro_per_km DECIMAL(3,2),
                        PRIMARY KEY (customer_id)
                        );


/*-------------------- POPULATING TABLES --------------------*/

-- The following dataset contains fictional data based on real-world values.                        
                        
                        
INSERT INTO transports
			VALUES
            (102,"international","2023-02-01","Germany","Wiesbaden",1195,20140601,1,19870914,1050,2,13,231.95),
            (202,"international","2023-02-01","Germany","Wiesbaden",1195,20140601,2,19720319,932,2,13,218.7),
            (302,"international","2023-02-03","France","Lille",1663,20140601,1,19780122,1015,5,17.25,321.5),
            (402,"domestic","2023-02-03","Hungary","Szombathely",421,20180101,3,19650510,880,3,4.5,81.4),
            (502,"international","2023-02-06","Germany","Zwickau",930,20180101,2,19870914,1090,3,12,179.8),
            (602,"international","2023-02-08","Germany","Eschweiler",1403,20150315,1,19720319,640,2,15.5,258.43),
            (702,"international","2023-02-08","Slovakia","Komárno",295,20171001,3,19650510,120,1,3.5,55.7),
            (802,"domestic","2023-02-09","Hungary","Jászberény",160,20180101,3,19650510,353,1,2.5,31),
            (902,"domestic","2023-02-10","Hungary","Szigetvár",363,20140601,3,19650510,914,3,4.25,64.75),
            (1002,"international","2023-02-13","Italy","Milan",1150,20150701,1,19720319,1095,2,12.5,214.1),
            (1102,"international","2023-02-14","Germany","Wiesbaden",1195,20140601,2,19870914,874,1,13,215),
            (1202,"international","2023-02-17","Belgium","Kortrijk",1647,20140601,1,19720319,980,2,18,318.42),
            (1302,"international","2023-02-17","Romania","Oradea",86,20171001,3,19650510,50,1,1.5,15.72),
            (1402,"domestic","2023-02-20","Hungary","Vác",250,20180101,3,19650510,720,1,3,45.8),
            (1502,"international","2023-02-20","Spain","Burgos",2618,20150315,4,19780122,950,3,30,498),
            (1602,"international","2023-02-20","Czech Republic","Ústí nad Labem",815,20171001,1,19720319,1100,4,9,140.95),
            (1702,"international","2023-02-22","France","Arcachon",2205,20150701,1,19720319,832,5,24,415.2),
            (1802,"domestic","2023-02-23","Hungary","Sátoraljaújhely",260,20140601,3,19650510,485,1,3.5,47.1),
            (1902,"domestic","2023-02-24","Hungary","Hatvan",190,20140601,3,19650510,574,3,2.75,36.5),
            (2002,"domestic","2023-02-27","Hungary","Orosháza",39,20180101,3,19650510,170,1,0.5,7.5),
            (2102,"international","2023-02-28","France","Dizy",1554,20140601,1,19780122,350,1,17,294),
            (2202,"international","2023-02-28","Germany","Wiesbaden",1195,20140601,4,19870914,1010,2,13,228.43)
            ;
            
INSERT INTO drivers
			VALUES
            (19650510,"Ernő","Urbancsek",203370992,0.05),
            (19780122,"Piotr","Adamcik",302166843,0.065),
            (19870914,"Ferenc","Kollár",307850449,0.065),
            (19720319,"László","Haraszti",704550711,0.065)
            ;
            
INSERT INTO vehicles
			VALUES
            (1,"DS-AA-483","box van","Volkswagen","Crafter","2017"),
            (2,"DS-AA-484","box van","Volkswagen","Crafter","2017"),
            (3,"EU-HU-007","box van","Ford","Transit","2022"),
            (4,"BK-RO-079","sheeted van","Renault","Master","2019")
            ;
            
INSERT INTO customers
			VALUES
            (20140601,"Tecno Solutions",0.33),
            (20150315,"Frazer Logistics",0.4),
            (20160815,"Gamma Warehousing",0.27),
            (20171001,"Europe Partners BV",0.4),
            (20180101,"Agriko-Hun",0.25)
            ;
            
SELECT * FROM transports;
SELECT * FROM drivers;
SELECT * FROM vehicles;
SELECT * FROM customers;



/*-------------------- UPDATING TABLES --------------------*/


-- One of the drivers changed their phone number which we can update in our database.


UPDATE drivers
SET phone_number = 703400786
WHERE first_name = "Ferenc";	-- It is recommended to use a unique identifier (the primary key or the phone number) with bigger datasets.



-- We decided to also add the drivers' email addresses. The new column should come after the phone number column.


ALTER TABLE drivers
ADD email_address VARCHAR(50)
AFTER phone_number;

UPDATE drivers
SET email_address = "erno65@transmail.hu"
WHERE first_name = "Ernő";

UPDATE drivers
SET email_address = "piotr.adam03@logistics.pl"
WHERE first_name = "Piotr";

UPDATE drivers
SET email_address = "ferikehu@e-mail.hu"
WHERE first_name = "Ferenc";

UPDATE drivers
SET email_address = "laszloharaszti@trsystems.ro"
WHERE first_name = "László";



/*------------------- EXPLORATORY ANALYSIS ------------------*/

-- Now that we have created, populated and updated our tables, we can start our analysis by asking and answering questions.


--  Who drove the most kilometers in February? - Haraszti László: 8415 km

SELECT
	d.driver_id,
	CONCAT(last_name," ",first_name) AS full_name,
	SUM(t.distance_km) AS total_km
FROM 
	drivers d
JOIN 
	transports t
	ON d.driver_id = t.driver_id
GROUP BY 
	d.driver_id
ORDER BY
	total_km DESC
LIMIT 1;


-- What is the average weight per country transported?

SELECT
	AVG(load_weight_kg),
    destination_country
FROM
	transports
GROUP BY
	destination_country;
    
    
-- How much money our company spent on fuel? - €3919.95

SELECT
	SUM(fuel_price)
FROM
	transports;
    
-- What is the biggest amount of money per transport spent on fuel? - €498.00

SELECT
	MAX(fuel_price) AS max_fuelprice
FROM
	transports;
    
    
-- Which customer gave us the most transport? - Tecno Solutions


SELECT
	c.customer_id,
    c.customer_name,
    COUNT(t.customer_id) AS number_of_transports
FROM
	customers c
JOIN
	transports t
    ON c.customer_id = t.customer_id
GROUP BY
	c.customer_id
ORDER BY
	number_of_transports DESC
LIMIT 1;


-- Select all the cities that are farther than 1000 km!

SELECT
	DISTINCT(destination_city),
    distance_km
FROM
	transports
WHERE
	distance_km > 1000
ORDER BY
	distance_km;
    
    
-- Display only the domestic transports in all capital letters, the customer's name and the driver's full name in descending order by distance.		                
                        
SELECT
	UPPER(t.transport_type) AS territory,
    c.customer_name,
    CONCAT(d.last_name," ",d.first_name) AS driver_name,
    t.distance_km
FROM
	transports t
JOIN 
	customers c 
	ON c.customer_id = t.customer_id
JOIN 
	drivers d 
	ON d.driver_id = t.driver_id
WHERE
	transport_type = "domestic"
ORDER BY
	distance_km DESC;
       
       
-- We have decided that we are going to give bonuses to the drivers based on their driving hours. Between 5 and 10 hours they should receive €7.00, above 10 hours the bonus is €12.00. Display each transports bonus category!

SELECT
	transport_id,
    transit_time_hours,
    CONCAT(d.last_name," ",d.first_name) AS driver_name,
CASE
	WHEN transit_time_hours > 10 THEN 12
    WHEN transit_time_hours BETWEEN 5.00 AND 10.00 THEN 7
    ELSE 0
	END AS driver_bonus_euro
FROM
	transports t
JOIN
	drivers d
    ON d.driver_id = t.driver_id;
    
    
-- Let's add this new column to the transports table.

ALTER TABLE transports
ADD driver_bonus_euro INT;

UPDATE transports
SET driver_bonus_euro = CASE
						WHEN transit_time_hours > 10 THEN 12
						WHEN transit_time_hours BETWEEN 5.00 AND 10.00 THEN 7
						ELSE 0
                        END;
                        

/*-------------------- EXPORT DATASET --------------------*/

-- Finally, we need to create a joined table with all the transport records and selected columns that we are going to export in CSV format for further analysis and reporting.
                        
                        
SELECT
	t.transport_id,
    t.transport_type,
    t.departure_date,
    t.destination_country,
    t.destination_city,
    t.distance_km,
    c.customer_name,
    c.euro_per_km,
    v.plate_number,
    d.first_name,
    d.last_name,
    d.salary_per_km,
    driver_bonus_euro,
    t.load_weight_kg,
    t.number_of_palets,
    t.transit_time_hours,
    fuel_price
FROM 
	transports t
JOIN
	customers c 
    ON c.customer_id = t.customer_id
JOIN
	drivers d 
    ON d.driver_id = t.driver_id
JOIN
	vehicles v 
    ON v.vehicle_id = t.vehicle_id
ORDER BY
	transport_id;
    
    
    
    