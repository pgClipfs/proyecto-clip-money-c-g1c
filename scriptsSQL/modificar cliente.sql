USE [virtualWallet]
GO

CREATE procedure [dbo].[ModificarCliente]
(
	@idCliente bigint,
	--@nombre char(10),
	--@apellido char(10),
	--@dni int,
	--@dniFotoFrente image,
	--@dniFotoReverso image,
	--@direccion char(15),
	--@nacionalidad char(15),
	--@provincia char(15),
	--@ciudad char(15),
	--@fechaNacimiento date,
	--@situacionCrediticia char(10),

	--@idClientenvo bigint,
	@nombrenvo char(10),
	@apellidonvo char(10),
	@dninvo int,
	@dniFotoFrentenvo image,
	@dniFotoReversonvo image,
	@direccionnvo char(15),
	@nacionalidadnvo char(15),
	@provincianvo char(15),
	@ciudadnvo char(15),
	@fechaNacimientonvo date,
	@situacionCrediticianvo char(10)
)
as
begin
update clientes
set nombre= @nombrenvo,
	apellido= @apellidonvo,
	dni=@dninvo,
	dniFotoFrente=@dniFotoFrentenvo,
	dniFotoReverso=@dniFotoReversonvo,
	direccion=@direccionnvo,
	nacionalidad=@nacionalidadnvo,
	provincia=@provincianvo,
	ciudad=@ciudadnvo,
	fechaNacimiento=@fechaNacimientonvo,
	situacionCrediticia=@situacionCrediticianvo

where idCliente=@idCliente;

end
go