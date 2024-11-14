### Activity: Creating an E-commerce Database Schema in MySQL

# In this activity, you will design a basic database schema for an e-commerce store. 
# This database will track customers, products, and orders. 

# Follow the steps below to create each table and establish relationships between them.

-- #### Reflection
-- - How do the tables work together to create a full picture of customers and orders?
-- - Why are foreign keys essential in linking different tables in a relational database?
-- - What challenges did you face in designing this schema?

#1 tables work together by forming a "relationship" with other tables to create a full display of information
#2 foreign keys are essential because not all tables need to live in the same table, i'm assuming that if only one table is created it will be a clutter of mess. that's why we create tables that use foreign tables so sub-tables can temporarily access the data of the main table and pair up


#### Instructions

-- 1. **Set up a new Database for the E-commerce Store**
--    - Create a new database for the e-commerce store.
--    - Select the new database to use it for the following steps.

-- 2. **Create the Customers Table**
--    - Design a table named `customers` to store customer information. 
--    - Include columns for the customer's unique ID, first name, last name, email, phone number, address, city, state, and zip code.
--    - Add a column to record the customer's registration date with a default value set to the current date and time.
--    - Make sure the `customer_id` is unique and automatically increments for each new customer.
--    - Set `email` to be unique to prevent duplicate entries.

-- 3. **Create the Products Table**
--    - Design a table named `products` to store product information available in the store.
--    - Include columns for the product’s unique ID, name, description, price, stock quantity, and a date indicating when the product was added to the inventory.
--    - Ensure the `product_id` is unique and automatically increments for each new product.
--    - Set the `price` column to allow values with two decimal places.

-- 4. **Create the Orders Table**
--    - Design a table named `orders` to store information about each order placed by customers.
--    - Include columns for a unique `order_id`, the `customer_id` (to link to the customer who placed the order), the date the order was placed, order status (e.g., Pending, Shipped, Delivered, or Cancelled), and the total order amount.
--    - Set `order_id` to be unique and automatically increment.
--    - Add a foreign key constraint linking `customer_id` in the `orders` table to the `customer_id` in the `customers` table.
--    - Set a default value for the `order_date` column to the current date and time.

-- 5. **Create the Order Details Table**
--    - Design a table named `order_details` to store details about each product within an order.
--    - Include columns for a unique ID for each order item, `order_id` (to link to the order it belongs to), `product_id` (to link to the purchased product), quantity ordered, and price per product at the time of the order.
--    - Set `order_id` and `product_id` as foreign keys to reference the `orders` and `products` tables, respectively.
--    - Ensure that each order detail has a unique `order_detail_id` that increments automatically.

-- 6. **Populate the Tables with Sample Data**
--    - Insert sample customer data into the `customers` table.
--    - Insert a few products into the `products` table.
--    - Create a sample order in the `orders` table for one of the customers.
--    - Add items to the `order_details` table for the sample order, referencing the products in the `products` table.

-- 7. **Write Queries to Test Your Database**
--    - Retrieve all orders for a specific customer, showing only the order IDs and dates.
--    - Retrieve all details for a specific order, showing each product’s name, quantity, and price per item.
--    - Write a query to update the stock in the `products` table after an order has been placed.

-- 8. **Consider Enhancements (Optional)**
--    - How might you add a "category" column for products to categorize items in the store?
--    - How would you track shipment dates for orders and delivery addresses if customers have multiple addresses?


-- CREATE TABLE customers (
--     customer_id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(20),
--     last_name VARCHAR(20),
--     email VARCHAR(50) UNIQUE,
--     phone VARCHAR(15), 
--     address VARCHAR(40),
--     city VARCHAR(20),
--     state VARCHAR(20),
--     zip INT,
--     regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE products (
--     product_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(20),
--     description VARCHAR(100),
--     price DECIMAL(10, 2),
--     stock INT,
--     regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE orders (
--     order_id INT AUTO_INCREMENT PRIMARY KEY,
--     customer_id INT,
--     order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
--     total_amount DECIMAL(10, 2),
--     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- );


-- CREATE TABLE order_details (
--     order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     price_per_product DECIMAL(10, 2),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip)
-- VALUES
-- ('John', 'Doe', 'johndoe@example.com', '1234567890', '123 Maple St', 'Springfield', 'IL', 62701),
-- ('Jane', 'Smith', 'janesmith@example.com', '2345678901', '456 Oak Ave', 'Lincoln', 'NE', 68501),
-- ('Mike', 'Brown', 'mikebrown@example.com', '3456789012', '789 Pine Rd', 'Madison', 'WI', 53703),
-- ('Emma', 'Davis', 'emmadavis@example.com', '4567890123', '101 Elm St', 'Orlando', 'FL', 32801),
-- ('Liam', 'Wilson', 'liamwilson@example.com', '5678901234', '202 Birch Blvd', 'Austin', 'TX', 73301),
-- ('Olivia', 'Taylor', 'oliviataylor@example.com', '6789012345', '303 Cedar Cir', 'Phoenix', 'AZ', 85001),
-- ('Noah', 'Anderson', 'noahanderson@example.com', '7890123456', '404 Spruce Dr', 'Denver', 'CO', 80201),
-- ('Ava', 'Thomas', 'avathomas@example.com', '8901234567', '505 Redwood Ln', 'Seattle', 'WA', 98101),
-- ('Ethan', 'Jackson', 'ethanjackson@example.com', '9012345678', '606 Magnolia Ct', 'Atlanta', 'GA', 30301),
-- ('Sophia', 'White', 'sophiawhite@example.com', '0123456789', '707 Chestnut Pl', 'New York', 'NY', 10001);

-- INSERT INTO products (name, description, price, stock)
-- VALUES
-- ('Laptop', '15-inch screen, 8GB RAM, 256GB SSD', 599.99, 20),
-- ('Smartphone', '6.5-inch display, 128GB storage', 399.99, 50),
-- ('Headphones', 'Noise-cancelling, wireless', 79.99, 100),
-- ('Smartwatch', 'Water-resistant, heart rate monitor', 149.99, 30),
-- ('Tablet', '10-inch screen, 64GB storage', 199.99, 40),
-- ('Camera', '24MP DSLR, 18-55mm lens', 499.99, 15),
-- ('Printer', 'Wireless, color printing', 129.99, 25),
-- ('Monitor', '27-inch 4K UHD', 299.99, 35),
-- ('Keyboard', 'Mechanical, RGB lighting', 49.99, 80),
-- ('Mouse', 'Wireless, ergonomic design', 29.99, 120);

-- INSERT INTO orders (customer_id, order_status, total_amount)
-- VALUES
-- (1, 'Shipped', 679.98),
-- (2, 'Delivered', 399.99),
-- (3, 'Pending', 149.99),
-- (4, 'Cancelled', 0.00),
-- (5, 'Shipped', 749.98),
-- (6, 'Delivered', 299.99),
-- (7, 'Pending', 499.99),
-- (8, 'Shipped', 579.98),
-- (9, 'Delivered', 79.99),
-- (10, 'Pending', 99.98);

-- INSERT INTO order_details (order_id, product_id, quantity, price_per_product)
-- VALUES
-- (1, 1, 1, 599.99),
-- (1, 3, 1, 79.99),
-- (2, 2, 1, 399.99),
-- (3, 4, 1, 149.99),
-- (5, 1, 1, 599.99),
-- (5, 5, 1, 149.99),
-- (6, 8, 1, 299.99),
-- (7, 6, 1, 499.99),
-- (8, 1, 1, 599.99),
-- (8, 10, 1, 29.99);

SELECT order_id, order_date
FROM orders
WHERE customer_id = 1;

SELECT p.name AS product_name, od.quantity, od.price_per_product
FROM order_details od
JOIN products p ON od.product_id = p.product_id
WHERE od.order_id = 1;

UPDATE products p
JOIN order_details od ON p.product_id = od.product_id
SET p.stock = p.stock - od.quantity
WHERE od.order_id = 1;





