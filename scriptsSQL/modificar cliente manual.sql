USE [virtualWallet]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ModificarCliente]
		@idCliente = 13,
		@nombrenvo = N'Caramelo',
		@apellidonvo = N'Saucedo',
		@dninvo = 40252365,
		@dniFotoFrentenvo = NULL,
		@dniFotoReversonvo = NULL,
		@direccionnvo = N'Arroyo 453',
		@nacionalidadnvo = N'Argentino',
		@provincianvo = N'Santa Fe',
		@ciudadnvo = N'Rosario',
		@fechaNacimientonvo = '2000-08-12',
		@situacionCrediticianvo = N'Aprobado'

SELECT	'Return Value' = @return_value

GO
