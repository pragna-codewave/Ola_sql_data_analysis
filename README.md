# OLA Ride Booking Data Analysis Project

## Project Overview
This project analyzes OLA ride booking data using SQL and Power BI to generate business insights related to bookings, cancellations, revenue, and customer behavior. The objective is to identify operational issues and improve overall efficiency and profitability.

---

## Tools & Technologies Used
- SQL Server (Data Cleaning, Transformation, Analysis)
- Power BI (Dashboard & Visualization)


---
## Dataset Description
The dataset includes:
- Booking details (Date, Time, Booking ID)
- Customer and driver information
- Vehicle types (Prime Sedan, SUV, Mini, Auto, Bike, E-Bike)
- Booking status (Success, Cancelled, Incomplete)
- Payment methods (UPI, Cash, Cards)
- Ride distance, booking value, ratings

---

## SQL Analysis

### Data Preparation
- Created database and table
- Imported data using BULK INSERT
- Explored and cleaned data

### Key Analysis Performed
- Successful bookings extraction
- Average ride distance by vehicle type
- Customer and driver cancellation analysis
- Top 5 customers by ride count
- Revenue calculation (total booking value)
- Driver and customer ratings analysis
- Incomplete ride analysis

### Views Created
- Successful_bookings
- ride_distance
- RideCancelled
- TOP5Customers
- RidesCancelledByDriver
- MAXMIN_Rating
- UPI_Payment
- Customer_Rating
- Booking_value
- incomplete_rides

---

## Power BI Dashboard

### Overview
- Total Bookings: 103K+
- Total Revenue: ₹57M
- Success Rate: ~62%
- Cancellation Rate: ~38%

### Key Visualizations
- Booking status breakdown
- Ride volume trend over time
- Revenue by payment method
- Top customers by booking value
- Vehicle-wise performance
- Cancellation reasons (customer & driver)

---

## Key Insights
- High cancellation rate (~38%) leads to major revenue loss
- Driver-related issues are the main cause of cancellations
- Demand is stable with consistent ride volume
- Revenue is evenly distributed across vehicle types
- Digital payment adoption is moderate with missing data
- High-value customers contribute significantly to revenue

---

## Business Recommendations
- Improve driver reliability and reduce cancellations
- Provide incentives and penalties for drivers
- Enhance customer experience and reduce wait time
- Promote digital payments like UPI
- Introduce loyalty programs for top customers
- Optimize driver allocation during peak hours

---

## Conclusion
The platform shows strong demand and revenue potential, but operational inefficiencies—especially driver-related issues—lead to high cancellations and revenue leakage. Improving execution can significantly increase profitability.
