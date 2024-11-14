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


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15), 
    address VARCHAR(40),
    city VARCHAR(20),
    state VARCHAR(20),
    zip INT,
    regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    regis_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_product DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

