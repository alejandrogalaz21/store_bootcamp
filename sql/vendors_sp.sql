-- Crear vendedor
CREATE PROCEDURE CreateVendor
    @name NVARCHAR(100),
    @age INT,
    @gender CHAR(1),
    @salesRegionId INT
AS
BEGIN
    INSERT INTO vendors (name, age, gender, sales_region_id, created_at, updated_at, active)
    VALUES (@name, @age, @gender, @salesRegionId, GETDATE(), GETDATE(), 1)
END;
GO

-- Leer vendedores activos
CREATE PROCEDURE ReadActiveVendors
AS
BEGIN
    SELECT * FROM vendors WHERE active = 1
END;
GO

-- Leer vendedor por ID
CREATE PROCEDURE ReadVendorById
    @id INT
AS
BEGIN
    SELECT * FROM vendors WHERE id = @id AND active = 1
END;
GO

-- Actualizar vendedor
CREATE PROCEDURE UpdateVendor
    @id INT,
    @name NVARCHAR(100),
    @age INT,
    @gender CHAR(1),
    @salesRegionId INT
AS
BEGIN
    UPDATE vendors
    SET name = @name, age = @age, gender = @gender, sales_region_id = @salesRegionId, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Eliminar vendedor (Borrado lógico)
CREATE PROCEDURE DeleteVendor
    @id INT
AS
BEGIN
    UPDATE vendors
    SET active = 0, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Restaurar vendedor (Activar registro previamente eliminado)
CREATE PROCEDURE RestoreVendor
    @id INT
AS
BEGIN
    UPDATE vendors
    SET active = 1, updated_at = GETDATE()
    WHERE id = @id AND active = 0
END;
GO