-- agregar use [nombre_bd_local]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE agregar_operacion
@TipoOpercion char(25),
@IdCuenta int
AS
BEGIN
DECLARE @FechaHoraActual as datetime
SET @FechaHoraActual = SYSDATETIME()  
INSERT INTO operaciones
	(
	   fechaHora,
	   tipoOperacion,
	   idCuenta
    )
values
	(
		@FechaHoraActual,
		@TipoOpercion,
		@IdCuenta
	)

END
GO
