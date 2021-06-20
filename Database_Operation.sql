-- TO Create a Database
CREATE DATABASE demo_database;
GO

-- Select Database that we want to use
USE demo_database;
GO

-- Rename Database -- Method 1
ALTER DATABASE demo_database MODIFY NAME = testing_database;
GO

-- Method 2
EXEC sp_renamedb 'testing_database' , 'demo_database';
GO

-- To Show all databases
SELECT * FROM sys.databases;
GO

-- Method 2
EXEC sp_databases;
GO

-- Backup Database
BACKUP DATABASE demo_database TO DISK = 'A:\SQL Server Management Studio\Database\demo_database.bak'
GO

-- A differential backup backs up only the files that changed since the last full back. For example, 
-- suppose you do a full backup on Sunday. On Monday you back up only the files that changed since Sunday,-- 
-- on Tuesday you back up only the files that changed since Sunday, and so on until the next full backup.
GO

-- Backup with Differential
BACKUP DATABASE demo_database TO DISK = 'A:\SQL Server Management Studio\Database\demo_database.bak' WITH DIFFERENTIAL;
GO

-- Delete Database
DROP DATABASE demo_database;
GO

-- Delete Database by using if exist condition
DROP DATABASE IF EXISTS demo_database;
GO