EMPLEADOS [9]

idEmpleado --PK
doc --FK references users
idEmpresa --FK references empresa
tratamiento
direccion
barrio
pais --FK references pais
ciudad --FK references ciudad
telefono
celular
correo
profesion
fechaCreacion
fechaRetiro
estadoEmpleado --FK references estados

ESTADOS [2]

idEstados -- PK
nombre 
descripcion

PAIS [3]

idPais --PK
sigla
nombre

CIUDAD [4]

idPais --FK references pais
idCiudad --PK
sigla
nombre

EMPRESA [6]

idEmpresa --PK
idCategoria --FK categoria
nit1
nit2
nombre1
nombre2
direccion1
direccion2
barrio
pais --FK references pais
ciudad --FK references ciudad
telefono
celular
correo

EMPRESA_BANCOS [8]

id --PK
idEmpresa --FK Empresa
idBanco --FK Banco
noCuenta
tipoCuenta
nombrePropietario

BANCOS [7]

idBanco --PK
nombre
descripcion

users [1]

tipoDoc
doc -- PK
name --Nombre completo
email
password

CATEGORIA [5]

idCategoria --PK
nombre
descripcion




