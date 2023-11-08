EXEC CreateProduct 
    @name = 'Nombre del Producto',
    @description = 'Descripción del Producto',
    @presentation = 'Presentación del Producto',
    @price = 100.00,
    @supplierId = 1;
GO

SELECT * FROM products 

SELECT * FROM products WHERE id=31

EXEC ReadActiveProducts

EXEC ReadProductById @id = 31

EXEC UpdateProduct 
	@id = 31,
	@name = 'Pokemon',
	@description = 'Descripción del Producto',	
	@presentation = 'Presentación del Producto',	
	@price = 100.00,	
	@supplierId= 1

EXEC DeleteProduct @id = 31

EXEC RestoreProduct @id = 31