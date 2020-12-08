--store procedure insertar cliente
USE virtualWallet
GO

create procedure  altacliente @nombre char(10), @apellido char(10), @dni int, @dniFotoFrente image, @dniFotoReverso image, @direccion char(15), @nacionalidad char(15), @provincia char(15), @ciudad char(15), @fechaNacimiento date, @situacionCrediticia char(10)
AS

BEGIN
 INSERT INTO clientes (nombre,apellido,dni,dniFotoFrente,dniFotoReverso,direccion,nacionalidad,provincia,ciudad,fechaNacimiento,situacionCrediticia)
 VALUES (@nombre,@apellido,@dni,@dniFotoFrente,@dniFotoReverso,@direccion,@nacionalidad,@provincia,@ciudad,@fechaNacimiento,@situacionCrediticia);
 END

 --ejecucion
--EXEC altacliente 'Diego','Sanchez',36547912,null,null,'Catamarca 495','Argentino','Cordoba','Cordoba',CURRENT_TIMESTAMP,'Aprobado';

