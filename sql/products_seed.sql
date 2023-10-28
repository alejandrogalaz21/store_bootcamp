USE store; -- Cambia al contexto de la base de datos 'store' (si ya existe)
GO

-- Insertar 10 filas de ejemplo en la tabla products
INSERT INTO products (name, description, presentation, price)
VALUES 
    ('Laptop Lenovo ThinkPad T490', '14" Business Laptop', 'Standard', 1099.99),
    ('Samsung Galaxy S20', '6.2" Smartphone', '128GB, Cosmic Gray', 999.99),
    ('Sony WH-1000XM4 Wireless Headphones', 'Noise Cancelling Headphones', 'Black', 349.99),
    ('Apple iPad Air (4th Gen)', '10.9" Tablet', '256GB, Space Gray', 649.00),
    ('Canon EOS R6 Mirrorless Camera', '20.1 MP Full-Frame Camera', 'Body Only', 2499.00),
    ('Dell UltraSharp U2720Q 27" Monitor', '4K UHD IPS Monitor', '27 Inch', 699.99),
    ('Bose QuietComfort Earbuds', 'Noise Cancelling Earbuds', 'Soapstone', 279.00),
    ('Logitech MX Master 3 Wireless Mouse', 'Advanced Wireless Mouse', 'Graphite', 99.99),
    ('Samsung 970 EVO Plus 1TB NVMe SSD', 'Internal Solid State Drive', 'M.2 NVMe Interface', 169.99),
    ('Amazon Echo Show 10 (3rd Gen)', 'Smart Display with Motion', 'Charcoal', 249.99);

SELECT TOP 10 * FROM products;
GO

UPDATE products SET price = 1200.99 WHERE id = 1;
GO