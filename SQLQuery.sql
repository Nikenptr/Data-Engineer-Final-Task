
create database DWH_Project;

use DWH_Project;

create table DimCustomer (
	CustomerID int primary key, 
	FirstName varchar(50),
	LastName varchar(50),
	Age varchar(50),
	Gender varchar(50),
	City varchar(50),
	NoHp varchar(50)
)

create table DimProduct (
	ProductID int primary key,
	ProductName varchar(50),
	ProductCategory varchar(50),
	ProductUnitPrice varchar(50)
)

create table DimStatusOrder (
	StatusID int primary key,
	StatusOrder varchar(50),
	StatusOrderDesc varchar(50)
)

create table FactSalesOrder (
	OrderID int primary key,
	CustomerID int,
	ProductID int,
	Quantity int,
	Amount int,
	StatusID int,
	OrderDate date
	FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)
)

