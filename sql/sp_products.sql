-- Crear producto
CREATE PROCEDURE CreateProduct
    @name NVARCHAR(100),
    @description NVARCHAR(255),
    @presentation NVARCHAR(50),
    @price DECIMAL(18, 2),
    @supplierId INT
AS
BEGIN
    INSERT INTO products (name, description, presentation, price, supplier_id, created_at, updated_at, active)
    VALUES (@name, @description, @presentation, @price, @supplierId, GETDATE(), GETDATE(), 1)
END;
GO

-- Leer productos activos
CREATE PROCEDURE ReadActiveProducts
AS
BEGIN
    SELECT * FROM products WHERE active = 1
END;
GO

-- Leer producto por ID
CREATE PROCEDURE ReadProductById
    @id INT
AS
BEGIN
    SELECT * FROM products WHERE id = @id AND active = 1
END;
GO

-- Actualizar producto
CREATE PROCEDURE UpdateProduct
    @id INT,
    @name NVARCHAR(100),
    @description NVARCHAR(255),
    @presentation NVARCHAR(50),
    @price DECIMAL(18, 2),
    @supplierId INT
AS
BEGIN
    UPDATE products
    SET name = @name, description = @description, presentation = @presentation, 
        price = @price, supplier_id = @supplierId, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Eliminar producto (Borrado lógico)
CREATE PROCEDURE DeleteProduct
    @id INT
AS
BEGIN
    UPDATE products
    SET active = 0, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Restaurar producto (Activar registro previamente eliminado)
CREATE PROCEDURE RestoreProduct
    @id INT
AS
BEGIN
    UPDATE products
    SET active = 1, updated_at = GETDATE()
    WHERE id = @id AND active = 0
END;
GO