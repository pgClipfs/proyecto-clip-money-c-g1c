USE [virtualWallet]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[altacliente]
		@nombre = N'Leandro',
		@apellido = N'Malano',
		@dni = 38883701,
		@dniFotoFrente = NULL,
		@dniFotoReverso = NULL,
		@direccion = N'H de Malvinas 458',
		@nacionalidad = N'Argentino',
		@provincia = N'Cordoba',
		@ciudad = N'Laguna Larga',
		@fechaNacimiento = '1995-04-17',
		@situacionCrediticia = N'Aprobado'

SELECT	'Return Value' = @return_value

GO
