--agregar use [nombre_bd_local]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE modificar_saldo 
@saldo numeric(18,0),
@idCuenta int
AS
BEGIN
UPDATE cuentas
   SET Saldo=@saldo
	   
WHERE  IdCuenta=@idCuenta
END
GO
