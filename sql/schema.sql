-- Tabla de productos
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    description NVARCHAR(255),
    presentation NVARCHAR(50),
    price DECIMAL(18, 2),
    supplierId INT FOREIGN KEY REFERENCES suppliers(id),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
);


-- Tabla de proveedores
CREATE TABLE suppliers (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    brand NVARCHAR(100),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
);


-- Tabla de vendedores
CREATE TABLE vendors (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100),
    age INT,
    gender CHAR(1),
    createdAt DATETIME DEFAULT GETDATE(),
    
    updatedAt DATETIME DEFAULT GETDATE(),
);

-- Tabla de regiones de ventas
CREATE TABLE sales_regions (
    id INT PRIMARY KEY IDENTITY,
    country NVARCHAR(100),
    regionName NVARCHAR(100),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
);