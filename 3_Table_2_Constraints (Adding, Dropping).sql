USE demo_database;
GO

-----------------------------------------------------------------------
----------------- Adding all constraINTs while creating a table -------
-----------------------------------------------------------------------

CREATE TABLE agent_details (listing_order INT IDENTITY (1,1), sap_id INT PRIMARY KEY, NAME VARCHAR (50) NOT NULL, system_login_id INT FOREIGN KEY REFERENCES id_details (system_login_id),
project VARCHAR(25) DEFAULT 'AirBnB',
email_id VARCHAR(15) UNIQUE, gender CHAR(1) CHECK(gender in('M','F')));  


------------------- Primary Key------------------------
CREATE table id_details_demo_1 (sap_id INT PRIMARY KEY,email_id INT, system_login_id INT, hr_id INT);
CREATE TABLE primary_key_demo_2 (
    sap_id INT,
    email_id INT,
    system_login_id INT,
    hr_id INT,
    PRIMARY KEY (sap_id)
);

----------------- Foreign Key--------------------------
CREATE table foreign_key_demo_1 (sap_id INT ,email_id INT, system_login_id INT  FOREIGN KEY REFERENCES id_details(system_login_id) , hr_id INT);
CREATE table foreign_key_demo_2 (sap_id INT ,email_id INT, system_login_id INT , hr_id INT CONSTRAINT FK_system_id FOREIGN KEY REFERENCES id_details(system_login_id));
CREATE TABLE foreign_key_demo_3 (
    sap_id INT,
    email_id INT,
    system_login_id INT,
    hr_id INT,
    CONSTRAINT FK_system_id_2 FOREIGN KEY (system_login_id)
        REFERENCES id_details (system_login_id)
);


----------------------------------------------------------------------------------------
-------------------------- Adding Constrain Ater creating a table ----------------------
-----------------------------------------------------------------------------------------

ALTER TABLE primary_key_demo_3 ADD PRIMARY KEY (sap_id);

ALTER TABLE foreign_key_demo_4 ADD FOREIGN KEY (system_login_id) REFERENCES id_details(system_login_id);
ALTER TABLE foreign_key_demo_4 ADD CONSTRAINT FK_SAP_ID FOREIGN KEY (system_login_id) REFERENCES id_details(system_login_id);

ALTER TABLE demo_table_6 ALTER COLUMN sap_id INT not null;
ALTER TABLE demo_table_6 ALTER COLUMN sap_id INT null;

ALTER TABLE demo_table_6 ADD UNIQUE (sap_id);
ALTER TABLE demo_table_6 ADD CONSTRAINT HR_ID_UK unique (hr_id);

ALTER TABLE demo_table_6 ADD CHECK (email_id LIKE('%gmail.com%'));
ALTER TABLE demo_table_6 ADD CONSTRAINT email_ID_CK CHECK (email_id LIKE('%gmail.com%')); 

ALTER TABLE demo_table_6 ADD CONSTRAINT hr_id_df DEFAULT 'ABC' FOR hr_id;
ALTER TABLE demo_table_6 ADD DEFAULT 'ABC' FOR hr_id;


----------------------------------------------------------------------------------------
------------------ DROP Constrain Ater creating a table ---------------------------------
-----------------------------------------------------------------------------------------

ALTER TABLE primary_key_demo_3 DROP CONSTRAINT [PK__primary___5E8533EBE64E5EA8];  -- TO know constraINT details -> EXEC sp_help table_name; 
ALTER TABLE foreign_key_demo_4 DROP CONSTRAINT [FK_SAP_ID]; -- Foreign key
ALTER TABLE unique_demo_6 DROP CONSTRAINT HR_ID_UK; -- Unique Key
ALTER TABLE check_demo_6 DROP CONSTRAINT [email_ID_CK]; -- Check
ALTER TABLE default_demo_6 DROP [DF__demo_tabl__hr_id__07C12930]; -- DEFAULT
