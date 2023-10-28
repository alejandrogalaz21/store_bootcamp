-- Table of products
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100), -- Name of the product
    description NVARCHAR(255), -- Description of the product
    presentation NVARCHAR(50), -- Presentation of the product
    price DECIMAL(18, 2), -- Price of the product
    supplier_id INT FOREIGN KEY REFERENCES suppliers(id), -- ID of the supplier
    created_at DATETIME DEFAULT GETDATE(), -- Date of registration
    updated_at DATETIME DEFAULT GETDATE(), -- Date of last update
    active BIT DEFAULT 1 -- Active flag for soft delete
);

-- Table of suppliers
CREATE TABLE suppliers (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100), -- Name of the supplier
    brand NVARCHAR(100), -- Brand of the supplier
    created_at DATETIME DEFAULT GETDATE(), -- Date of registration
    updated_at DATETIME DEFAULT GETDATE(), -- Date of last update
    active BIT DEFAULT 1 -- Active flag for soft delete
);

-- Table of vendors
CREATE TABLE vendors (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(100), -- Name of the vendor
    age INT, -- Age of the vendor
    gender CHAR(1), -- Gender of the vendor
    sales_region_id INT FOREIGN KEY REFERENCES sales_regions(id), -- ID of the sales region
    created_at DATETIME DEFAULT GETDATE(), -- Date of registration
    updated_at DATETIME DEFAULT GETDATE(), -- Date of last update
    active BIT DEFAULT 1 -- Active flag for soft delete
);

-- Table of sales regions
CREATE TABLE sales_regions (
    id INT PRIMARY KEY IDENTITY,
    country NVARCHAR(100), -- Country
    region_name NVARCHAR(100), -- Name of the region
    created_at DATETIME DEFAULT GETDATE(), -- Date of registration
    updated_at DATETIME DEFAULT GETDATE(), -- Date of last update
    active BIT DEFAULT 1 -- Active flag for soft delete
);