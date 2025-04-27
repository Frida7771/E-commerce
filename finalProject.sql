-- E-Commerce Database System
-- This project creates a database schema for an e-commerce platform
-- specializing in beauty and personal care products.
-- drop
-- DROP SCHEMA IF EXISTS `damg6210-Project`;
-- Create and use the database schema
CREATE SCHEMA `damg6210-Project`;
USE `damg6210-Project`;
-- Supplier table stores information about product suppliers
CREATE TABLE `Supplier` (
  `SupplierID` VARCHAR(11) NOT NULL,
  `CompanyName` TEXT DEFAULT NULL,
  `Address` VARCHAR(255) DEFAULT NULL,
  `City` VARCHAR(255),
  `State` VARCHAR(50) DEFAULT NULL,
  `Zipcode` VARCHAR(10) DEFAULT NULL,
  `Country` VARCHAR(100) DEFAULT NULL,
  `ContactPerson` VARCHAR(255) DEFAULT NULL,
  `ContactNumber` VARCHAR(100) DEFAULT NULL,
  `ContactEmail` VARCHAR(255) DEFAULT NULL,
  `ContactFax` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
);

-- Products table stores product information
CREATE TABLE `Products` (
  `ProductID` VARCHAR(11) NOT NULL,
  `ProductName` VARCHAR(255) DEFAULT NULL,
  `SupplierID` VARCHAR(11) DEFAULT NULL,
  `Category` VARCHAR(255) DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) DEFAULT NULL, -- Changed from VARCHAR to DECIMAL for better data management
  `Color` VARCHAR(255) DEFAULT NULL,
  `QuantityOnHand` INT DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
);

-- Order_Details table contains information about items in each order
CREATE TABLE `Order_Details` (
  `OrderID` VARCHAR(11) NOT NULL,
  `ProductID` VARCHAR(11) DEFAULT NULL,
  `ItemQuantity` INT DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
);

-- Buyers table stores customer information
CREATE TABLE `Buyers` (
  `BuyerID` VARCHAR(11) NOT NULL,
  `TelNumber` VARCHAR(100) DEFAULT NULL,
  `Email` VARCHAR(255) DEFAULT NULL,
  `UserName` VARCHAR(255) DEFAULT NULL,
  `Password` VARCHAR(255), -- Note: In a real system, passwords should be encrypted
  `ShipAddress` VARCHAR(255) DEFAULT NULL, -- Fixed typo in column name
  `ShipCity` VARCHAR(255) DEFAULT NULL,
  `ShipState` VARCHAR(50) DEFAULT NULL,
  `ShipCountry` VARCHAR(255),
  `ShipZipcode` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`BuyerID`)
);

-- Shipment table contains shipping information
CREATE TABLE `Shipment` (
  `ShippingID` VARCHAR(11) NOT NULL,
  `ShipTEL` VARCHAR(100) DEFAULT NULL,
  `ShipperName` VARCHAR(255),
  PRIMARY KEY (`ShippingID`)
);

-- Payment table stores payment information
CREATE TABLE `Payment` (
  `PaymentID` VARCHAR(11) NOT NULL,
  `CardHolderName` VARCHAR(255) DEFAULT NULL,
  `CardType` VARCHAR(255) DEFAULT NULL,
  `CreditCard` VARCHAR(255), -- Note: In a real system, credit card data should be encrypted
  `CredExpMo` TINYINT DEFAULT NULL, -- Changed from MEDIUMINT to TINYINT for month
  `CardExpYr` SMALLINT DEFAULT NULL, -- Changed from MEDIUMINT to SMALLINT for year
  `BillingAddress` VARCHAR(255) DEFAULT NULL,
  `BillingCity` VARCHAR(255),
  `BillingState` VARCHAR(50) DEFAULT NULL,
  `BillingZipcode` VARCHAR(10) DEFAULT NULL,
  `BillCountry` VARCHAR(100) DEFAULT NULL,
  `OrderID` VARCHAR(11) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
);

-- Orders table containing order information
CREATE TABLE `Orders` (
  `OrderID` VARCHAR(11) NOT NULL,
  `BuyerID` VARCHAR(11) NOT NULL,
  `Total_amount` DECIMAL(10,2) DEFAULT NULL, -- Changed from MEDIUMINT to DECIMAL
  `Total_quantity` INT DEFAULT NULL, -- Changed from MEDIUMINT to INT
  `PaymentID` VARCHAR(11) NOT NULL,
  `PaymentDate` DATE, -- Changed from VARCHAR to DATE
  `OrderDate` DATE, -- Changed from VARCHAR to DATE
  `Cancel` BOOLEAN DEFAULT 0, -- Changed from TEXT to BOOLEAN
  `Paid` BOOLEAN DEFAULT 0, -- Changed from TEXT to BOOLEAN
  `Fulfilled` BOOLEAN DEFAULT 0, -- Changed from TEXT to BOOLEAN
  `ShipDate` DATE, -- Changed from VARCHAR to DATE
  `ShippingID` VARCHAR(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT Orders_FK1 FOREIGN KEY (BuyerID) REFERENCES Buyers(BuyerID),
  CONSTRAINT Orders_FK2 FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
  CONSTRAINT Orders_FK3 FOREIGN KEY (ShippingID) REFERENCES Shipment(ShippingID)
);

-- Set up foreign key relationships
ALTER TABLE Products
ADD CONSTRAINT Products_FK1 FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);

ALTER TABLE Order_Details
ADD CONSTRAINT OrderDetails_FK1 FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Orders
ADD CONSTRAINT Orders_FK4 FOREIGN KEY (OrderID) REFERENCES Order_Details(OrderID);

-- Insert sample data into Supplier table
INSERT INTO `Supplier` (`SupplierID`,`CompanyName`,`Address`,`City`,`State`,`Zipcode`,`Country`,`ContactPerson`,`ContactNumber`,`ContactEmail`,`ContactFax`) VALUES 
("30918186609","BeautySource","8496 Sed St.","Annapolis","Maryland","36447","United States","Montana Griffin","1-547-354-2975","Montana.Griffin@beautysource.com","1-747-514-7405"),
("70268860023","NaturalEssence","P.O. Box 185, 7096 Fusce St.","Minneapolis","MN","12392","United States","Jamal Ward","1-808-398-1802","Jamal.Ward@naturalessence.ca","1-633-148-7287"),
("31704489846","PureGlow","747-1877 Fusce Street","Montpelier","Vermont","45116","United States","Breanna Tran","1-179-453-8363","Breanna.Tran@pureglow.com","1-402-203-9423"),
("68659281779","LuxeBeauty","6077 Id St.","Springdale","Arkansas","71245","United States","Armando Whitfield","1-201-374-3545","Armando.Whitfield@luxebeauty.com","1-214-295-9506"),
("12716365607","SkinCare Co.","Ap #924-2093 Nisi Road","South Burlington","Vermont","61177","United States","Venus Tyson","1-635-591-2113","Venus.Tyson@skincareco.com","1-624-477-4294"),
("30751277561","HairCare Plus","Ap #559-963 Aliquet. Avenue","Bangor","ME","46316","United States","Gil Watts","1-384-828-2779","Gil.Watts@haircareplus.co.uk","1-921-770-8330"),
("39656653836","MakeupMaster","396-5140 Sodales Rd.","Little Rock","Arkansas","72723","United States","Galvin Keller","1-870-828-3188","Galvin.Keller@makeupmaster.com","1-266-190-0065"),
("39599259968","P&G Beauty","4166 Id Avenue","Athens","GA","93824","United States","Xanthus Phillips","1-592-174-7801","Xanthus.Phillips@pgbeauty.com","1-137-184-4261"),
("12241497023","BeautyWorks","P.O. Box 135, 8772 Mauris Avenue","Minneapolis","Minnesota","34193","United States","Yael Reyes","1-925-532-3739","Yael.Reyes@beautyworks.com","1-795-854-4581"),
("43636501698","GlamSupply","824-4773 Neque. Avenue","Bellevue","Nebraska","99315","United States","McKenzie Owen","1-156-811-6215","McKenzie.Owen@glamsupply.net","1-577-204-1040");

-- Insert sample data into Products table
INSERT INTO `Products` (`ProductID`,`ProductName`,`SupplierID`,`Category`,`UnitPrice`,`Color`,`QuantityOnHand`) VALUES 
("748130-5105","Hydrating Lotion","12241497023","Hair",6.83,"yellow",109),
("206908-3232","Makeup Remover","31704489846","Lip",29.58,"green",898),
("332338-2345","Beauty Serum","68659281779","Face",56.17,"red",271),
("096419-4823","Beauty Blush","30918186609","Cheek",26.70,"red",551),
("585230-0077","Gift Sets","39656653836","Cheek",5.24,"red",514),
("197710-3876","Moisturizing Lotion","70268860023","Eye, Face",26.98,"green",794),
("533169-3365","Premium Shampoo","30751277561","Body, Hair",84.35,"yellow",916),
("588681-0034","Lip Moisturizer","39599259968","Lip",73.53,"blue",162),
("998757-5991","Deluxe Gift Sets","43636501698","Skincare",59.44,"orange",827),
("375163-6428","Makeup Primer","12716365607","Face",2.72,"red",464);

-- Insert sample data into Order_Details table
INSERT INTO `Order_Details` (`OrderID`,`ProductID`,`ItemQuantity`) VALUES 
("05553373345","748130-5105",57),
("07261862587","206908-3232",26),
("21942566549","332338-2345",34),
("47217024154","096419-4823",57),
("70701609058","585230-0077",13),
("85764031654","197710-3876",29),
("89878325779","533169-3365",11),
("90817183713","588681-0034",9),
("96945305380","998757-5991",46),
("99251300121","375163-6428",81);

-- Insert sample data into Buyers table
INSERT INTO `Buyers` (`BuyerID`,`TelNumber`,`Email`,`UserName`,`Password`,`ShipAddress`,`ShipCity`,`ShipState`,`ShipCountry`,`ShipZipcode`) VALUES 
("94908631679","1-772-737-2701","clark.johnson@example.ca","Clark","JFA79CQJ8XU","P.O. Box 504, 7630 Lacus Rd.","Viransehir","Sanliurfa","Liberia","65242"),
("89264121725","1-905-188-8108","noble.smith@example.edu","Noble","AOF35ISM0QN","2510 Tellus Avenue","Joliet","IL","Christmas Island","86876"),
("50345881058","1-850-899-9543","tashya.brown@example.edu","Tashya","PDE87LWL3PY","8200 Quis, Street","Vezirköprü","Samsun","Guinea-Bissau","M5Y 1Z0"),
("81921795835","1-583-615-6760","aretha.wilson@example.org","Aretha","ANP81YWC9CU","Ap #516-795 Nisi Road","Mildura","VIC","Singapore","4505"),
("26350935579","1-865-217-7844","abbot.jones@example.org","Abbot","VSR52BPA7OY","951-727 A Street","Laramie","WY","Morocco","007708"),
("12714972662","1-102-293-5153","vance.miller@example.net","Vance","RST79SIK9CB","1341 In St.","Jerez de la Frontera","AN","Singapore","53506"),
("75521050479","1-959-804-3019","matthew.davis@example.com","Matthew","PWN64YUG3AJ","253-4847 Rutrum Ave","Callander","PE","Mongolia","ZN53 8TG"),
("72330070747","1-184-195-5645","dominic.taylor@example.ca","Dominic","OFX66VPY2TS","Ap #976-802 Dignissim Street","Islahiye","Gaz","Finland","33067"),
("42711312958","1-317-594-7754","lynn.anderson@example.ca","Lynn","JEE58NSU1DO","7377 Cras Rd.","Gotzis","Vbg","Seychelles","C5E 9C8"),
("67711139299","1-632-629-5645","dustin.harris@example.net","Dustin","BSW81VNC4BY","Ap #972-7019 Nulla Street","Orangeville","ON","Marshall Islands","113921");

-- Insert sample data into Shipment table
INSERT INTO `Shipment` (`ShippingID`,`ShipTEL`,`ShipperName`) VALUES 
("93438458936","1-111-222-3333","DHL"),
("09462963286","1-228-832-3305","Fedex"),
("02373273025","1-717-664-9542","UPS"),
("90750814057","1-288-751-7876","UPS"),
("86649590825","1-585-683-9924","UPS"),
("43358910115","1-650-659-5553","Fedex"),
("73874731131","1-732-599-2845","UPS"),
("44764907944","1-837-186-2802","UPS"),
("14265493321","1-183-564-7100","Fedex"),
("81892563843","1-444-555-6666","USPS");

-- Insert sample data into Payment table
INSERT INTO `Payment` (`PaymentID`,`CardHolderName`,`CardType`,`CreditCard`,`CredExpMo`,`CardExpYr`,`BillingAddress`,`BillingCity`,`BillingState`,`BillingZipcode`,`BillCountry`,`OrderID`) VALUES 
("79922775587","Ruth Conway","JCB","448528 7520883769",11,2024,"173-7331 Semper, St.","Amstelveen","Noord Holland","48257","Mongolia","10423068699"),
("26660945790","Willow Solis","Visa","4532802912657",12,2024,"129-2522 At, Rd.","Minneapolis","Minnesota","96354","Burkina Faso","81537344499"),
("57773141099","Venus Holland","JCB","4556331596954",11,2021,"316-4992 Duis St.","Belfast","Ulster","8960","Netherlands","35958952099"),
("39477519625","Margaret Berry","Visa","4556557037126",3,2023,"828-5278 Vitae Av.","Quesada","Alajuela","96727","Åland Islands","64766274299"),
("38387495295","Giacomo Bryant","Discover","4916344775203687",3,2021,"P.O. Box 717, 3210 Pede, Street","Igboho","Oyo","79987","Jersey","39450640399"),
("31863280913","Alexander Bell","JCB","471670 547393 0304",4,2020,"1603 Ut, St.","Steenokkerzeel","VB","4375 FZ","Tanzania","84632895499"),
("49871562602","Clinton Parks","American Express","448551 2676119878",8,2021,"710-5611 Massa St.","Elversele","OV","U7G 1OM","Spain","73488575399"),
("36297339285","Erica Townsend","Discover","4539605158431500",4,2020,"831-967 Eleifend Rd.","Valley East","ON","8212","Cape Verde","61482494299"),
("92384433306","Gannon Decker","American Express","4539 049 41 1088",3,2025,"1073 Suspendisse St.","Slupsk","Pomorskie","61317","Togo","95732033799"),
("83308456699","Tamekah Roman","Visa","4929766014453",8,2021,"927-4982 Suspendisse Av.","Cervinara","Campania","797729","Malawi","88468168899");

-- Insert sample data into Orders table
INSERT INTO `Orders` (`OrderID`,`BuyerID`,`Total_amount`,`Total_quantity`,`PaymentID`,`PaymentDate`,`OrderDate`,`Cancel`,`Paid`,`Fulfilled`,`ShipDate`,`ShippingID`) VALUES 
("21942566549","50345881058",47.81,1,"57773141099","2023-07-02","2023-07-02",0,1,1,"2023-07-03","81892563843"),
("07261862587","12714972662",177.48,6,"26660945790","2023-08-01","2023-08-01",0,1,1,"2023-08-06","86649590825"),
("96945305380","42711312958",56.17,4,"36297339285","2023-06-16","2023-06-15",0,1,1,"2023-06-16","02373273025"),
("89878325779","72330070747",133.50,11,"83308456699","2023-02-24","2023-02-24",0,1,1,"2023-02-27","93438458936"),
("99251300121","81921795835",68.12,8,"92384433306","2023-09-03","2023-09-03",0,1,1,"2023-09-05","14265493321"),
("90817183713","67711139299",53.96,9,"49871562602","2023-10-16","2023-10-16",0,1,0,"2023-10-19","09462963286"),
("85764031654","94908631679",927.85,2,"31863280913","2023-11-03","2023-11-03",0,1,1,"2023-11-07","44764907944"),  
("47217024154","26350935579",661.77,5,"39477519625","2023-05-09","2023-05-09",0,1,1,"2023-05-10","43358910115"),
("70701609058","89264121725",237.76,13,"38387495295","2023-05-18","2023-05-18",0,1,1,"2023-05-22","73874731131"),
("05553373345","75521050479",21.76,7,"79922775587","2023-07-06","2023-07-06",0,1,1,"2023-07-10","90750814057");

-- ============================================
-- Business Analytics Queries
-- ============================================

-- 1. Most popular payment method
SELECT CardType, COUNT(*) AS popular 
FROM Payment 
GROUP BY CardType 
ORDER BY popular DESC;

-- 2. Most popular products by quantity sold
CREATE VIEW product_popularity AS 
SELECT ProductName, ItemQuantity 
FROM Products 
JOIN Order_Details ON Products.ProductID = Order_Details.ProductID;

SELECT ProductName, SUM(ItemQuantity) AS total_sold 
FROM product_popularity 
GROUP BY ProductName
ORDER BY total_sold DESC;

-- 3. Sales by country
SELECT ShipCountry, COUNT(*) AS order_count 
FROM Buyers 
LEFT JOIN Orders ON Buyers.BuyerID = Orders.BuyerID 
GROUP BY ShipCountry
ORDER BY order_count DESC;

-- 4. Product purchase history by buyer
SELECT 
    b.UserName, 
    b.Email, 
    p.ProductName, 
    p.Category, 
    od.ItemQuantity, 
    o.OrderDate
FROM Buyers b
LEFT JOIN Orders o ON b.BuyerID = o.BuyerID
LEFT JOIN Order_Details od ON o.OrderID = od.OrderID
LEFT JOIN Products p ON od.ProductID = p.ProductID
ORDER BY b.UserName, o.OrderDate DESC;

-- 5. Customer order frequency
SELECT 
    b.UserName, 
    COUNT(o.OrderID) AS order_count, 
    MIN(o.OrderDate) AS first_order, 
    MAX(o.OrderDate) AS last_order,
    SUM(o.Total_amount) AS total_spent
FROM Buyers b
INNER JOIN Orders o ON o.BuyerID = b.BuyerID
GROUP BY b.UserName
ORDER BY order_count DESC;

-- 6. Supplier product distribution
SELECT 
    s.CompanyName AS supplier_name, 
    COUNT(p.ProductID) AS product_count,
    SUM(p.QuantityOnHand) AS total_inventory,
    AVG(p.UnitPrice) AS avg_price
FROM Supplier s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
ORDER BY product_count DESC;

-- 7. Order fulfillment times
SELECT 
    o.OrderID, 
    DATEDIFF(o.ShipDate, o.PaymentDate) AS days_to_ship,
    sh.ShipperName
FROM Orders o
JOIN Shipment sh ON o.ShippingID = sh.ShippingID
ORDER BY days_to_ship;

-- 8. Total Revenue
SELECT FORMAT(SUM(Total_amount), 2) AS total_revenue 
FROM Orders;

-- 9. Average Order Value
SELECT FORMAT(AVG(Total_amount), 2) AS average_order_value 
FROM Orders;

-- 10. Revenue by product category
SELECT 
    p.Category, 
    FORMAT(SUM(p.UnitPrice * od.ItemQuantity), 2) AS category_revenue
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
WHERE p.Category IS NOT NULL AND p.Category != ''
GROUP BY p.Category
ORDER BY category_revenue DESC;

-- ============================================
-- Inventory Management System
-- ============================================

-- Create a copy of Products table for testing triggers
CREATE TABLE Products_Inventory LIKE Products;
INSERT INTO Products_Inventory SELECT * FROM Products;

-- Create table to track low stock levels
CREATE TABLE Stockcheck (
    ProductID VARCHAR(11), 
    ProductName VARCHAR(255),
    QuantityOnHand INT,
    Stocklevel VARCHAR(100),
    AlertDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger to monitor inventory levels
DELIMITER //
CREATE TRIGGER stocklevel_alert
AFTER UPDATE ON Products_Inventory
FOR EACH ROW
BEGIN
    IF NEW.QuantityOnHand <= 100 THEN
        INSERT INTO Stockcheck (ProductID, ProductName, QuantityOnHand, Stocklevel)
        VALUES(NEW.ProductID, NEW.ProductName, NEW.QuantityOnHand, "Low-stock");
    END IF;
END //
DELIMITER ;

-- Create table to track price changes
CREATE TABLE price_update (
    ProductID VARCHAR(11), 
    ProductName VARCHAR(255),
    old_price DECIMAL(10,2), 
    new_price DECIMAL(10,2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create procedure to update product prices
DELIMITER //
CREATE PROCEDURE update_price (IN product_id VARCHAR(11), IN new_price DECIMAL(10,2))
BEGIN
    UPDATE Products_Inventory
    SET UnitPrice = new_price
    WHERE ProductID = product_id;
END //
DELIMITER ;

-- Create trigger to log price changes
DELIMITER //
CREATE TRIGGER price_change_log
AFTER UPDATE ON Products_Inventory
FOR EACH ROW
BEGIN
    IF OLD.UnitPrice != NEW.UnitPrice THEN
        INSERT INTO price_update(ProductID, ProductName, old_price, new_price)
        VALUES (OLD.ProductID, OLD.ProductName, OLD.UnitPrice, NEW.UnitPrice);
    END IF;
END //
DELIMITER ;

-- Example of updating prices and checking inventory
-- Make sure we can update
SET SQL_SAFE_UPDATES = 0;

-- Update a price (this will trigger price_change_log)
CALL update_price('096419-4823', 29.99);

-- Simulate inventory reduction (this will trigger stocklevel_alert)
UPDATE Products_Inventory
SET QuantityOnHand = 75
WHERE ProductID = '588681-0034';

-- Check results
SELECT * FROM Products_Inventory WHERE ProductID = '096419-4823' OR ProductID = '588681-0034';
SELECT * FROM price_update;
SELECT * FROM Stockcheck;

-- ============================================
-- Monthly Sales Report
-- ============================================

-- Create view for monthly sales report
CREATE VIEW monthly_sales AS
SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS month,
    COUNT(o.OrderID) AS order_count,
    SUM(o.Total_amount) AS monthly_revenue,
    AVG(o.Total_amount) AS avg_order_value,
    SUM(o.Total_quantity) AS items_sold
FROM Orders o
GROUP BY DATE_FORMAT(o.OrderDate, '%Y-%m')
ORDER BY month;

-- Query the view
SELECT * FROM monthly_sales;

-- ============================================
-- User-Defined Functions (UDF)
-- ============================================

-- Function to calculate discount based on order total
DELIMITER //
CREATE FUNCTION calculate_discount(order_total DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount_amount DECIMAL(10,2);
    
    IF order_total >= 500 THEN
        SET discount_amount = order_total * 0.15; -- 15% discount for orders $500+
    ELSEIF order_total >= 200 THEN
        SET discount_amount = order_total * 0.10; -- 10% discount for orders $200-499
    ELSEIF order_total >= 100 THEN
        SET discount_amount = order_total * 0.05; -- 5% discount for orders $100-199
    ELSE
        SET discount_amount = 0; -- No discount for orders under $100
    END IF;
    
    RETURN discount_amount;
END //
DELIMITER ;

-- Function to calculate shipping days based on shipping method
DELIMITER //
CREATE FUNCTION estimated_shipping_days(shipper_name VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days INT;
    
    CASE shipper_name
        WHEN 'Fedex' THEN SET days = 2;
        WHEN 'UPS' THEN SET days = 3;
        WHEN 'DHL' THEN SET days = 2;
        WHEN 'USPS' THEN SET days = 5;
        ELSE SET days = 4;
    END CASE;
    
    RETURN days;
END //
DELIMITER ;

-- Example usage of UDFs
SELECT 
    o.OrderID, 
    o.Total_amount, 
    calculate_discount(o.Total_amount) AS discount_amount,
    o.Total_amount - calculate_discount(o.Total_amount) AS final_amount,
    s.ShipperName,
    estimated_shipping_days(s.ShipperName) AS estimated_days
FROM 
    Orders o
JOIN 
    Shipment s ON o.ShippingID = s.ShippingID
ORDER BY 
    o.Total_amount DESC;

-- ============================================
-- Customer Segmentation
-- ============================================

-- Create view for customer purchase analysis
CREATE VIEW customer_segments AS
SELECT
    b.BuyerID,
    b.UserName,
    COUNT(o.OrderID) AS order_count,
    SUM(o.Total_amount) AS total_spent,
    AVG(o.Total_amount) AS avg_order_value,
    CASE
        WHEN COUNT(o.OrderID) >= 3 THEN 'Frequent'
        WHEN COUNT(o.OrderID) = 2 THEN 'Regular'
        WHEN COUNT(o.OrderID) = 1 THEN 'New'
        ELSE 'Inactive'
    END AS purchase_frequency,
    CASE
        WHEN SUM(o.Total_amount) > 500 THEN 'High Value'
        WHEN SUM(o.Total_amount) > 100 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value
FROM Buyers b
LEFT JOIN Orders o ON b.BuyerID = o.BuyerID
GROUP BY b.BuyerID, b.UserName;

-- Query the view
SELECT * FROM customer_segments ORDER BY total_spent DESC;