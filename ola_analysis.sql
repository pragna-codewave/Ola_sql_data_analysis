-- ============================================
-- OLA BOOKINGS DATA ANALYSIS PROJECT
-- ============================================

-- Step 1: Create Database
-- This ensures a fresh database is created every time the script runs

USE MASTER
GO

IF EXISTS(SELECT 1 FROM sys.databases WHERE name='Ola_Bookings')
BEGIN
    ALTER DATABASE Ola_Bookings SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE Ola_Bookings
END

CREATE DATABASE Ola_Bookings
GO

-- Step 2: Use the created database
USE Ola_Bookings
GO

-- Step 3: Create Table
-- This table stores ride booking data including customer, driver, payment, and ratings

IF OBJECT_ID('ride_bookings','U') IS NOT NULL
   DROP TABLE ride_bookings

CREATE TABLE ride_bookings (
    Date DATE,
    Time TIME,
    Booking_ID NVARCHAR(20),
    Booking_Status NVARCHAR(50),
    Customer_ID NVARCHAR(20),
    Vehicle_Type NVARCHAR(50),
    Pickup_Location NVARCHAR(100),
    Drop_Location NVARCHAR(100),
    V_TAT INT, -- Vehicle Turnaround Time
    C_TAT INT, -- Customer Turnaround Time
    Canceled_Rides_by_Customer NVARCHAR(100),
    Canceled_Rides_by_Driver NVARCHAR(100),
    Incomplete_Rides NVARCHAR(10),
    Incomplete_Rides_Reason NVARCHAR(255),
    Booking_Value DECIMAL(10,2),
    Payment_Method NVARCHAR(50),
    Ride_Distance DECIMAL(10,2),
    Driver_Ratings DECIMAL(3,2),
    Customer_Rating DECIMAL(3,2)
);

-- Step 4: Load Data from CSV
-- BULK INSERT is used for fast data loading

BULK INSERT ride_bookings
FROM 'C:\Users\ASUS\Desktop\Sql\Ola\Booking.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

-- Step 5: Explore Data
SELECT * FROM ride_bookings


-- ============================================
-- ANALYSIS USING VIEWS
-- ============================================

-- 1. Retrieve all successful bookings
-- Business Use: Helps analyze completed rides and revenue generation
CREATE VIEW Successful_bookings AS
SELECT *
FROM ride_bookings
WHERE Booking_Status = 'Success'


-- 2. Average ride distance by vehicle type
-- Business Use: Understand usage pattern of different vehicle categories
CREATE VIEW ride_distance AS
SELECT 
Vehicle_Type,
AVG(Ride_Distance) AS Avg_Distance
FROM ride_bookings
GROUP BY Vehicle_Type


-- 3. Total rides canceled by customers
-- Business Use: Identify customer dissatisfaction or pricing issues
CREATE VIEW RideCancelled AS
SELECT 
COUNT(*) AS RideCancelled
FROM ride_bookings
WHERE Booking_Status = 'Canceled by Customer'


-- 4. Top 5 customers by ride count
-- Business Use: Identify loyal/high-value customers
CREATE VIEW TOP5Customers AS
SELECT TOP 5 
Customer_ID,
COUNT(*) AS TotalRides
FROM ride_bookings
GROUP BY Customer_ID
ORDER BY TotalRides DESC


-- 5. Rides canceled by drivers (specific reason)
-- Business Use: Identify operational issues (driver reliability)
CREATE VIEW RidesCancelledByDriver AS 
SELECT 
COUNT(*) AS RidesCancelledByDriver
FROM ride_bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue'


-- 6. Max & Min driver ratings for Prime Sedan
-- Business Use: Evaluate service quality for premium segment
CREATE VIEW MAXMIN_Rating AS
SELECT
MAX(Driver_Ratings) AS MaxRating,
MIN(Driver_Ratings) AS MinRating
FROM ride_bookings
WHERE Vehicle_Type = 'Prime Sedan' AND Driver_Ratings > 0


-- 7. Rides paid using UPI
-- Business Use: Analyze digital payment adoption
CREATE VIEW UPI_Payment AS
SELECT *
FROM ride_bookings
WHERE Payment_Method = 'UPI'


-- 8. Average customer rating by vehicle type
-- Business Use: Compare customer satisfaction across services
CREATE VIEW Customer_Rating AS
SELECT 
Vehicle_Type,
AVG(Customer_Rating) AS AvgRating
FROM ride_bookings
WHERE Customer_Rating > 0
GROUP BY Vehicle_Type


-- 9. Total booking value for successful rides
-- Business Use: Measure total revenue generated
CREATE VIEW Booking_value AS
SELECT
SUM(Booking_Value) AS TotalAmount
FROM ride_bookings
WHERE Booking_Status = 'Success'


-- 10. Incomplete rides with reason
-- Business Use: Identify failure points in ride lifecycle
CREATE VIEW incomplete_rides AS 
SELECT *
FROM ride_bookings
WHERE Booking_Status != 'Success'
