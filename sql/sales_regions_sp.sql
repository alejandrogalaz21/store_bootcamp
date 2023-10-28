-- Crear región de ventas
CREATE PROCEDURE CreateSalesRegion
    @country NVARCHAR(100),
    @regionName NVARCHAR(100)
AS
BEGIN
    INSERT INTO sales_regions (country, region_name, created_at, updated_at, active)
    VALUES (@country, @regionName, GETDATE(), GETDATE(), 1)
END;
GO

-- Leer regiones de ventas activas
CREATE PROCEDURE ReadActiveSalesRegions
AS
BEGIN
    SELECT * FROM sales_regions WHERE active = 1
END;
GO

-- Leer región de ventas por ID
CREATE PROCEDURE ReadSalesRegionById
    @id INT
AS
BEGIN
    SELECT * FROM sales_regions WHERE id = @id AND active = 1
END;
GO

-- Actualizar región de ventas
CREATE PROCEDURE UpdateSalesRegion
    @id INT,
    @country NVARCHAR(100),
    @regionName NVARCHAR(100)
AS
BEGIN
    UPDATE sales_regions
    SET country = @country, region_name = @regionName, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Eliminar región de ventas (Borrado lógico)
CREATE PROCEDURE DeleteSalesRegion
    @id INT
AS
BEGIN
    UPDATE sales_regions
    SET active = 0, updated_at = GETDATE()
    WHERE id = @id AND active = 1
END;
GO

-- Restaurar proveedor (Activar registro previamente eliminado)
CREATE PROCEDURE RestoreSalesRegion
    @id INT
AS
BEGIN
    UPDATE sales_regions
    SET active = 1, updated_at = GETDATE()
    WHERE id = @id AND active = 0
END;
GO