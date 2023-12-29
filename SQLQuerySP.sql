use DWH_Project;

CREATE PROCEDURE summary_order_status 
@StatusID INT
AS
 BEGIN
	SELECT 
		FactSalesOrder.OrderID, DimCustomer.FullName, DimProduct.ProductName,
		FactSalesOrder.Quantity, DimStatusOrder.StatusOrder
	FROM FactSalesOrder
		JOIN DimCustomer ON FactSalesOrder.CustomerID = DimCustomer.CustomerID
		JOIN DimProduct ON FactSalesOrder.ProductID = DimProduct.ProductID
		JOIN DimStatusOrder ON FactSalesOrder.StatusID = DimStatusOrder.StatusID
	WHERE DimStatusOrder.StatusID = @StatusID
END;


EXEC summary_order_status @StatusID = 1;

select * from DimStatusOrder;
