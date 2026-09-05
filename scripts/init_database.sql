/*=========================
Create DataBase and Schemas
===========================
Script purpose:
this script creates a new database names 'DataWarehouse' after checking if it already exists. 
if the database exists, it is dropped and recreated. in addition, the script sets up three schemas within the database: 'bronze', 'silver', 'gold'. 

========
Warning:
========
running  this script will drop the entire 'DataWarehouse' database if it exists. 
all data in the database will be permanently deleted. proceed with caution and ensure you proper backups before running this script.*/

use master;
go

-- drop and recreate the 'dataWarehouse' database
if exists (select 1 from sys.databases where name = 'DataWarehouse')
begin 
alter database DataWarehouse set single_user with rollback immediate;
drop database DataWarehouse;
end;
go

-- Create the 'DataWarehouse' database 
create database DataWarehouse;
go


use DataWarehouse;

-- Create Schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go
