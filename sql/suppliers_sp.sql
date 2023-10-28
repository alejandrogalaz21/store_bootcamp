-- Crear proveedor
CREATE PROCEDURE CreateSupplier
    @name NVARCHAR(100),
    @brand NVARCHAR(100)
AS
BEGIN
    INSERT INTO suppliers (name, brand, created_at, updated_at, active)
    VALUES (@name, @brand, GETDATE(), GETDATE(), 1)
END;
GO

-- Leer proveedores activos
CREATE PROCEDURE ReadActiveSuppliers
AS
BEGIN
    SELECT * FROM suppliers WHERE active = 1
END;
GO

-- Leer proveedor por ID
CREATE PROCEDURE ReadSupplierById
    @id INT
AS
BEGIN
    SELECT * FROM suppliers WHERE id = @id AND active = 1
END;
GO

-- Actualizar proveedor
CREATE PROCEDURE UpdateSupplier
    @id INT,
    @name NVARCHAR(100),
    @brand NVARCHAR(100)
AS
BEGIN
    UPDATE suppliers
    SET name = @name, brand = @brand, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Eliminar proveedor (Borrado lógico)
CREATE PROCEDURE DeleteSupplier
    @id INT
AS
BEGIN
    UPDATE suppliers
    SET active = 0, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Restaurar proveedor (Activar registro previamente eliminado)
CREATE PROCEDURE RestoreSupplier
    @id INT
AS
BEGIN
    UPDATE suppliers
    SET active = 1, updated_at = GETDATE()
    WHERE id = @id AND active = 0
END;
GO