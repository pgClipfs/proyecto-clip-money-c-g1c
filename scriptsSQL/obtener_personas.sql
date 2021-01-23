USE [virtual_wallet]
GO
/****** Object:  StoredProcedure [dbo].[obtener_personas]    Script Date: 22/01/2021 22:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[obtener_personas]
	
	@idCliente int

AS
BEGIN
	select idCliente, email, direccion, telefono  from clientes WHERE idCliente=@idCliente
END