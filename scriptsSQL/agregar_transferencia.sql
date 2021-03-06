
/****** Object:  StoredProcedure [dbo].[agregar_operacion]    Script Date: 22-Jan-21 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[agregar_transferencia]
@TipoOperacion char(50),
@IdCuenta int,
@IdCuentaDestino int,
@Monto numeric (18,0)
AS
BEGIN
DECLARE @FechaHoraActual as datetime
SET @FechaHoraActual = SYSDATETIME()  
INSERT INTO operaciones
	(
	   fechaHora,
	   tipoOperacion,
	   idCuenta,
	   idCuentaDestino,
	   monto
    )
values
	(
		@FechaHoraActual,
		@TipoOperacion,
		@IdCuenta,
		@IdCuentaDestino,
		@Monto
	)
END
