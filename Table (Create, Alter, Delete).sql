
use demo_database;
GO

---------------------------------------------------------------------------
---------------------------------CREATE TABLE------------------------------
---------------------------------------------------------------------------
GO

-- Create a Simple table without any constraints
CREATE TABLE person_1 (person_id int,first_name varchar(50), last_name varchar(50), address varchar(255), city varchar(255));
GO

-- CREATE TABLE with Constraints
CREATE TABLE person_2 
	(person_id int NOT NULL PRIMARY KEY IDENTITY (1,1), 
	first_name varchar(50) NOT NULL, 
	last_name varchar(50) DEFAULT 'NA',
	email varchar(50) UNIQUE check (email like('%gmail.com')), city varchar(30));
GO

-- CREATING A TABLE FROM ANOTHER TABLE
-- Method 1
SELECT * INTO person_3 FROM person_2;
GO

-- Method 2
SELECT person_id, first_name INTO person_4 from person_1;
GO


---------------------------------------------------------------------------
-----------------------Clearing TABLE--------------------------------------
---------------------------------------------------------------------------


-- To Drop Entire TABLE
DROP TABLE person_2;
GO


-- TO drop only Data of the table
TRUNCATE TABLE person_1;
GO


---------------------------------------------------------------------------
-----------------------Altering TABLE--------------------------------------
---------------------------------------------------------------------------


--------------------   ADD ------------------------------------------------

-- ADD Column
ALTER TABLE person_2 ADD address varchar(255);
GO

-- ADD Multiple columns in Table
ALTER TABLE person_2 ADD 
	region varchar(20),
	country varchar(20);
GO


--------------------------- DELETE ------------------------------------------------

-- DELETE Column
ALTER TABLE person_2 DROP COLUMN address;
GO


--------------------------- ALTERING ------------------------------------------------

-- Change Column's Datatype
ALTER TABLE person_2 ALTER COLUMN city char NOT NULL;


-- Rename Column Name
EXEC sp_rename 'person_2.city' , 'Area', 'COLUMN';
GO

-- Rename TABLE
EXEC sp_rename 'person_2' , 'person_2nd';
GO


---------------------------------------------------------------------------
-----------------------Show ALL TABLES--------------------------------------
---------------------------------------------------------------------------

-- Show ALL Tables from Database
SELECT * FROM INFORMATION_SCHEMA.TABLES;





