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