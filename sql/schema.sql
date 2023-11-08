USE store_local; -- Cambia al contexto de la base de datos 'store' (si ya existe)
GO

-- Table of products
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    description NVARCHAR(255),
    presentation NVARCHAR(50),
    price DECIMAL(18, 2),
    supplier_id INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    active BIT DEFAULT 1
);
GO

-- Table of suppliers
CREATE TABLE suppliers (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    brand NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    active BIT DEFAULT 1
);
GO

-- Table of vendors
CREATE TABLE vendors (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    age INT,
    gender CHAR(1),
    sales_region_id INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    active BIT DEFAULT 1
);
GO

-- Table of sales regions
CREATE TABLE sales_regions (
    id INT PRIMARY KEY IDENTITY,
    country NVARCHAR(100),
    region_name NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    active BIT DEFAULT 1
);
GO

-- Agregar restricciones de clave foránea
ALTER TABLE products
ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(id);
GO

ALTER TABLE vendors
ADD FOREIGN KEY (sales_region_id) REFERENCES sales_regions(id);
GO

--          TRIGERS          --

-- Triger para actualizar la columna updated_at después de INSERT y UPDATE
CREATE TRIGGER ProductsTriggerCreateAndUpdateAt
ON products
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Es una inserción, actualiza created_at y updated_at
        UPDATE products
        SET created_at = GETDATE(), updated_at = GETDATE()
        FROM products
        INNER JOIN inserted ON products.id = inserted.id;
    END
    ELSE
    BEGIN
        -- Es una actualización, solo actualiza updated_at
        UPDATE products
        SET updated_at = GETDATE()
        FROM products
        INNER JOIN inserted ON products.id = inserted.id;
    END
END;
GO    

-- Triger para actualizar la columna updated_at después de INSERT y UPDATE
CREATE TRIGGER SuppliersTriggerCreateAndUpdateAt
ON suppliers
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Es una inserción, actualiza created_at y updated_at
        UPDATE suppliers
        SET created_at = GETDATE(), updated_at = GETDATE()
        FROM suppliers
        INNER JOIN inserted ON suppliers.id = inserted.id;
    END
    ELSE
    BEGIN
        -- Es una actualización, solo actualiza updated_at
        UPDATE suppliers
        SET updated_at = GETDATE()
        FROM suppliers
        INNER JOIN inserted ON suppliers.id = inserted.id;
    END
END;
GO

-- Triger para actualizar la columna updated_at después de INSERT y UPDATE
CREATE TRIGGER VendorsTriggerCreateAndUpdateAt
ON vendors
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Es una inserción, actualiza created_at y updated_at
        UPDATE vendors
        SET created_at = GETDATE(), updated_at = GETDATE()
        FROM vendors
        INNER JOIN inserted ON vendors.id = inserted.id;
    END
    ELSE
    BEGIN
        -- Es una actualización, solo actualiza updated_at
        UPDATE vendors
        SET updated_at = GETDATE()
        FROM vendors
        INNER JOIN inserted ON vendors.id = inserted.id;
    END
END;
GO

-- Triger para actualizar la columna updated_at después de INSERT y UPDATE
CREATE TRIGGER SalesRegionsTriggerCreateAndUpdateAt
ON sales_regions
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Es una inserción, actualiza created_at y updated_at
        UPDATE sales_regions
        SET created_at = GETDATE(), updated_at = GETDATE()
        FROM sales_regions
        INNER JOIN inserted ON sales_regions.id = inserted.id;
    END
    ELSE
    BEGIN
        -- Es una actualización, solo actualiza updated_at
        UPDATE sales_regions
        SET updated_at = GETDATE()
        FROM sales_regions
        INNER JOIN inserted ON sales_regions.id = inserted.id;
    END
END;
GO

-- SEED

-- Insertar datos de ejemplo en la tabla sales_regions
INSERT INTO sales_regions (country, region_name)
VALUES 
    ('USA', 'East Coast'),
    ('Canada', 'Ontario'),
    ('UK', 'London'),
    ('Germany', 'Bavaria'),
    ('Australia', 'Sydney');
GO

-- Insertar datos de ejemplo en la tabla suppliers
INSERT INTO suppliers (name, brand)
VALUES 
    ('Supplier 1', 'Brand A'),
    ('Supplier 2', 'Brand B'),
    ('Supplier 3', 'Brand C'),
    ('Supplier 4', 'Brand D'),
    ('Supplier 5', 'Brand E');
GO

-- Insertar datos de ejemplo en la tabla vendors
INSERT INTO vendors (name, age, gender, sales_region_id)
VALUES 
    ('John Doe', 30, 'M', 1),
    ('Jane Smith', 25, 'F', 2),
    ('Mike Johnson', 35, 'M', 3),
    ('Lisa Davis', 28, 'F', 1),
    ('Chris Wilson', 32, 'M', 2);
GO

-- Insertar datos de ejemplo en la tabla products
INSERT INTO products (name, description, presentation, price, supplier_id)
VALUES 
    ('Laptop Lenovo ThinkPad T490', '14" Business Laptop', 'Standard', 1099.99, 1),
    ('Samsung Galaxy S20', '6.2" Smartphone', '128GB, Cosmic Gray', 999.99, 2),
    ('Sony WH-1000XM4 Wireless Headphones', 'Noise Cancelling Headphones', 'Black', 349.99, 3),
    ('Apple iPad Air (4th Gen)', '10.9" Tablet', '256GB, Space Gray', 649.00, 1),
    ('Canon EOS R6 Mirrorless Camera', '20.1 MP Full-Frame Camera', 'Body Only', 2499.00, 4),
    ('Dell UltraSharp U2720Q 27" Monitor', '4K UHD IPS Monitor', '27 Inch', 699.99, 5),
    ('Bose QuietComfort Earbuds', 'Noise Cancelling Earbuds', 'Soapstone', 279.00, 3),
    ('Logitech MX Master 3 Wireless Mouse', 'Advanced Wireless Mouse', 'Graphite', 99.99, 5),
    ('Samsung 970 EVO Plus 1TB NVMe SSD', 'Internal Solid State Drive', 'M.2 NVMe Interface', 169.99, 5),
    ('Amazon Echo Show 10 (3rd Gen)', 'Smart Display with Motion', 'Charcoal', 249.99, 5);
GO
