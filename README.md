# E-Commerce Beauty Products Database System

This project implements a complete relational database system for an e-commerce platform specializing in beauty and personal care products.  
The system supports business operations such as product inventory management, order tracking, customer analytics, and revenue reporting.

## 📚 Project Structure

- `schema.sql`: Full database schema creation including tables, constraints, and sample data inserts.
- `queries.sql`: Business intelligence queries, analytics views, stored procedures, triggers, and user-defined functions (UDFs).

## 🛠️ Technologies Used

- **Database**: MySQL
- **Queries**: SQL (DDL, DML, Views, Procedures, Triggers, Functions)
- **Tools**: MySQL Workbench, Terminal

## 🗄️ Database Design Highlights

- 8 core tables: `Supplier`, `Products`, `Buyers`, `Orders`, `Order_Details`, `Shipment`, `Payment`, `Products_Inventory`
- Sample data populated for realistic business simulation
- Foreign key constraints to maintain referential integrity
- Optimized column data types (e.g., DECIMAL for pricing, BOOLEAN for status flags)

## 📈 Business Analytics

- Most popular products by quantity sold
- Most used payment methods
- Sales distribution by customer country
- Monthly sales reports
- Customer segmentation based on purchase behavior

## ⚙️ Special Features

- **Triggers**:
  - Low stock alerts when product inventory drops below 100 units
  - Price change logging when product prices are updated
- **Stored Procedures**:
  - Procedure to update product prices dynamically
- **User-Defined Functions (UDFs)**:
  - Calculate order discounts based on total amount
  - Estimate shipping days based on carrier
- **Views**:
  - Monthly sales analytics
  - Customer segmentation by activity and value

## 🚀 How to Run

1. Import `schema.sql` into your MySQL server to create tables and insert sample data.
2. Import `queries.sql` to add business intelligence views, triggers, procedures, and functions.
3. Run SELECT queries to analyze data and monitor system behavior.

## 📊 Example Analyses

- Top-selling products
- Total revenue generated
- Average order value
- Order fulfillment times by shipping carrier
- Customer purchase history tracking

---

### 🔥 Project Developed by: Frida  
If you like it, feel free to ⭐️ this repo!

