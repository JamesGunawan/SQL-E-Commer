-- ### Activity: Creating an E-commerce Database Schema in MySQL

-- # In this activity, you will design a basic database schema for an e-commerce store. 
-- # This database will track customers, products, and orders. 

-- # Follow the steps below to create each table and establish relationships between them.

-- #### Reflection
-- - How do the tables work together to create a full picture of customers and orders?
-- - Why are foreign keys essential in linking different tables in a relational database?
-- - What challenges did you face in designing this schema?

-- #1 tables work together by forming a "relationship" with other tables to create a full display of information
-- #2 foreign keys are essential because not all tables need to live in the same table, i'm assuming that if only one table is created it will be a clutter of mess. that's why we create tables that use foreign tables so sub-tables can temporarily access the data of the main table and pair up


-- #### Instructions

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

-- Create a database for e-commerce management
CREATE DATABASE e_commerce;

-- Create the 'customers' table to store customer details.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique id for each customer that auto-increments
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50) UNIQUE, -- Email address must be unique meaning no duplicate emails
    phone VARCHAR(15), 
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(20),
    zip INT,
    regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for when the customer registered 
);

-- Create the 'products' table to store product details.
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique id for each product that auto-increments
    name VARCHAR(20),
    description VARCHAR(100),
    price DECIMAL(10, 2), -- Price with two decimal places
    stock INT,
    regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestand for when the product was registered
);

-- Create the 'orders' table to store order details.
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique id for each order that auto-increments
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp for when the order was placed
    order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending', -- status of the order
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Link to the customer who made the order
);

-- Create the 'order_items' table to store product details for each order.
CREATE TABLE order_items (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique id for each order item that auto-increments
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_product DECIMAL(10, 2), -- Price with two decimal places
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Link to the order in the orders table
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Link to the product in the products table
);

-- Sample data into the 'customers' table.
-- Each entry represents a customer with their contact details and address.

-- INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip)
-- VALUES 
--     ('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm St', 'Springfield', 'IL', 62701),
--     ('Jane', 'Smith', 'janesmith@example.com', '234-567-8901', '456 Oak St', 'Chicago', 'IL', 60601),
--     ('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '789 Pine St', 'Peoria', 'IL', 61602),
--     ('Bob', 'Brown', 'bobbrown@example.com', '456-789-0123', '101 Maple St', 'Champaign', 'IL', 61820),
--     ('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234', '202 Birch St', 'Decatur', 'IL', 62521);

-- Insert sample data into the 'products' table.
-- Each entry represents a product with its name, description, price, and stock quantity.
-- INSERT INTO products (name, description, price, stock)
-- VALUES
--     ('Laptop', 'High performance laptop with 16GB RAM and 512GB SSD', 1200.00, 50),
--     ('Smartphone', 'Latest model with 128GB storage and 5G support', 799.99, 100),
--     ('Headphones', 'Noise-cancelling over-ear headphones', 150.00, 150),
--     ('Tablet', '10-inch tablet with stylus support', 299.99, 30),
--     ('Monitor', '27-inch 4K resolution monitor', 350.00, 20);

-- Insert sample data into the 'orders' table.
-- Each entry represents an order placed by a customer, including the order status and total amount.
-- INSERT INTO orders (customer_id, order_date, order_status, total_amount)
-- VALUES
--     (1, '2024-11-20 14:30:00', 'Pending', 1300.00),
--     (2, '2024-11-21 09:00:00', 'Shipped', 799.99),
--     (3, '2024-11-22 16:00:00', 'Delivered', 450.00),
--     (4, '2024-11-23 10:15:00', 'Pending', 299.99),
--     (5, '2024-11-24 18:30:00', 'Cancelled', 0.00);

-- Insert sample data into the 'order_items' table.
-- Each entry links a product with an order, specifying the quantity and price at the time of purchase.
-- INSERT INTO order_items (order_id, product_id, quantity, price_per_product)
-- VALUES
--     (1, 1, 1, 1200.00), -- Laptop for John Doe
--     (2, 2, 1, 799.99), -- Smartphone for Jane Smith
--     (3, 3, 2, 150.00), -- Headphones for Alice Johnson
--     (3, 4, 1, 299.99), -- Tablet for Alice Johnson
--     (4, 4, 1, 299.99); -- Tablet for Bob Brown

-- Query to retrieve customer details along with their order information.
SELECT
    customers.customer_id, 
    customers.first_name, 
    customers.last_name, 
    customers.email, 
    customers.phone, 
    customers.address,
    customers.city,
    customers.zip,
    orders.order_date,
    orders.order_status,
    orders.total_amount
FROM customers
INNER JOIN orders ON orders.customer_id = customers.customer_id;
    
-- Query to retrieve details about the products in each order.
SELECT 
    order_items.order_detail_id,
    orders.order_id,
    orders.order_date,
    orders.order_status,
    products.name,
    order_items.quantity,
    order_items.price_per_product,
    (order_items.quantity * order_items.price_per_product) AS total_price
FROM 
    order_items
JOIN 
    orders ON order_items.order_id = orders.order_id
JOIN 
    products ON order_items.product_id = products.product_id;
