--1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(200),
    Salary DECIMAL
)
--2.Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees
ADD Department VARCHAR(50);

--3.Remove the "Salary" column from the "Employees" table.
ALTER TABLE Employees
DROP COLUMN Salary;

--4.Rename the "Department" column in the "Employees" table to "DeptName".
ALTER TABLE Employees
RENAME COLUMN Department TO DeptName;

--5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
    ProjectID INT,
    ProjectName VARCHAR(255)
);
--6.Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Employees
ADD PRIMARY KEY (ID);

--7.Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE Employees
ADD CONSTRAINT fk_project
FOREIGN KEY (ID) REFERENCES Projects(ProjectID);

--8.Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE Employees
DROP CONSTRAINT fk_project;

--9.Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD CONSTRAINT unique_name UNIQUE (Name);

--10.Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(200),
    LastName VARCHAR(200),
    Email VARCHAR(200),
    Status VARCHAR(200)
);
--11.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers
ADD CONSTRAINT unique_fullname UNIQUE (FirstName, LastName);

--12.Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE Customers
ADD CONSTRAINT df_status DEFAULT 'Active' FOR Status;

--13.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL
);
--14.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE Orders
ADD CONSTRAINT chk_totalamount CHECK (TotalAmount > 0);

--15.Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales;
ALTER SCHEMA Sales TRANSFER dbo.Orders;

--16.Rename the "Orders" table to "SalesOrders."
ALTER TABLE Sales.Orders
RENAME TO SalesOrders