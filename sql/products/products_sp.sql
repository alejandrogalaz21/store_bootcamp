USE store; -- Cambia al contexto de la base de datos 'store' (si ya existe)
GO

-- Crear producto
CREATE PROCEDURE CreateProduct
    @name NVARCHAR(100),
    @description NVARCHAR(255),
    @presentation NVARCHAR(50),
    @price DECIMAL(18, 2),
    @supplierId INT
AS
BEGIN
    INSERT INTO products (name, description, presentation, price, supplier_id, active)
    VALUES (@name, @description, @presentation, @price, @supplierId, 1)
END;
GO

SELECT * FROM products GO

/* EXEC CreateProduct 
    @name = 'Nombre del Producto',
    @description = 'Descripción del Producto',
    @presentation = 'Presentación del Producto',
    @price = 100.00,
    @supplierId = 1;
GO
*/

-- Leer productos activos
CREATE PROCEDURE ReadActiveProducts
AS
BEGIN
    SELECT * FROM products WHERE active = 1
END;
GO

 -- EXEC ReadActiveProducts; 

-- Leer producto por ID
CREATE PROCEDURE ReadProductById
    @id INT
AS
BEGIN
    SELECT * FROM products WHERE id = @id AND active = 1
END;
GO

/*EXEC ReadProductById 
    @id = 29;
GO
*/

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
        price = @price, supplier_id = @supplierId
    WHERE id = @id AND active = 1
END;
GO

-- Eliminar producto (Borrado lógico)
CREATE PROCEDURE DeleteProduct
    @id INT
AS
BEGIN
    UPDATE products
    SET active = 0
    WHERE id = @id AND active = 1
END;
GO

-- Restaurar producto (Activar registro previamente eliminado)
CREATE PROCEDURE RestoreProduct
    @id INT
AS
BEGIN
    UPDATE products
    SET active = 1
    WHERE id = @id AND active = 0
END;
GO