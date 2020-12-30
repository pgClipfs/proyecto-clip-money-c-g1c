USE [virtualWallet]
GO
CREATE procedure  [dbo].[top10operaciones] 

AS
BEGIN
SELECT TOP (10) [idOperacion]
      ,[fechaHora]
      ,[tipoOperacion]
      ,[idCuentaDestino]
      ,[idCuenta]
  FROM [dbo].[operaciones]

 END
GO