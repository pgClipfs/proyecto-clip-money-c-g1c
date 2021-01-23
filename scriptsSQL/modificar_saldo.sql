USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[modificar_saldo]    Script Date: 21/01/2021 11:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[modificar_saldo]
@saldo numeric(18,0),
@idCuenta int
AS
BEGIN
UPDATE cuentas
   SET Saldo=@saldo
	   
WHERE  IdCuenta=@idCuenta
END
