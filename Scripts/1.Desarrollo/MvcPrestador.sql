
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'UriServicioOrdenesAtencion' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> UriServicioOrdenesAtencion'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'UriServicioOrdenesAtencion',N'*',N'http://pruebas.servicios.saludsa.com.ec/servicioOrdenesAtencion/')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'http://pruebas.servicios.saludsa.com.ec/servicioOrdenesAtencion/'
	where [Codigo]='UriServicioOrdenesAtencion' and [Servicio] = N'*'
	PRINT 'Actualizado -> UriServicioOrdenesAtencion'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ObtenerRetencionesAutorizadas' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ObtenerRetencionesAutorizadas'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ObtenerRetencionesAutorizadas',N'*',N'api/Retenciones/ObtenerAutorizadas')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/Retenciones/ObtenerAutorizadas'
	where [Codigo]='ObtenerRetencionesAutorizadas' and [Servicio] = N'*'
	PRINT 'Actualizado -> ObtenerRetencionesAutorizadas'
END




IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiArmonixDiagnostico' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiArmonixDiagnostico'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiArmonixDiagnostico',N'*',N'api/diagnostico/getByFilterPaginated')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/diagnostico/getByFilterPaginated'
	where [Codigo]='ApiArmonixDiagnostico' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiArmonixDiagnostico'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiObtenerContratoCobertura' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiObtenerContratoCobertura'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiObtenerContratoCobertura',N'*',N'api/contrato/ObtenerContratoCobertura')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/contrato/ObtenerContratoCobertura'
	where [Codigo]='ApiObtenerContratoCobertura' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiObtenerContratoCobertura'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiGuardarOrdenAtencion' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiGuardarOrdenAtencion'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiGuardarOrdenAtencion',N'*',N'api/ordenatencion/GuardarOrdenAtencion')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/ordenatencion/GuardarOrdenAtencion'
	where [Codigo]='ApiGuardarOrdenAtencion' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiGuardarOrdenAtencion'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiPrestadorValidarAutenticacion' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiPrestadorValidarAutenticacion'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiPrestadorValidarAutenticacion',N'*',N'api/Seguridad/ValidarAutenticacion')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/Seguridad/ValidarAutenticacion'
	where [Codigo]='ApiPrestadorValidarAutenticacion' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiPrestadorValidarAutenticacion'
END



IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiContratoObtenerClienteNoCliente' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiContratoObtenerClienteNoCliente'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiContratoObtenerClienteNoCliente',N'*',N'api/contrato/ObtenerClienteNoCliente')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/contrato/ObtenerClienteNoCliente'
	where [Codigo]='ApiContratoObtenerClienteNoCliente' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiContratoObtenerClienteNoCliente'
END




IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiPrestadorCambiarContrasena' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiPrestadorCambiarContrasena'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiPrestadorCambiarContrasena',N'*',N'api/Seguridad/CambiarContrasena')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/Seguridad/CambiarContrasena'
	where [Codigo]='ApiPrestadorCambiarContrasena' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiPrestadorCambiarContrasena'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiObtenerContratoAmbulatorio' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiObtenerContratoAmbulatorio'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiObtenerContratoAmbulatorio',N'*',N'api/contrato/ObtenerContratoAmbulatorio')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/contrato/ObtenerContratoAmbulatorio'
	where [Codigo]='ApiObtenerContratoAmbulatorio' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiObtenerContratoAmbulatorio'
END



IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiObtenerUrlOda' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiObtenerUrlOda'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiObtenerUrlOda',N'*',N'api/ordenatencion/ObtenerUrlOda')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/ordenatencion/ObtenerUrlOda'
	where [Codigo]='ApiObtenerUrlOda' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiObtenerUrlOda'
END



IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'ApiObtenerOrdenAtencionRedSalud' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> ApiObtenerOrdenAtencionRedSalud'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'ApiObtenerOrdenAtencionRedSalud',N'*',N'api/ordenatencion/ObtenerOrdenAtencionRedSalud')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'api/ordenatencion/ObtenerOrdenAtencionRedSalud'
	where [Codigo]='ApiObtenerOrdenAtencionRedSalud' and [Servicio] = N'*'
	PRINT 'Actualizado -> ApiObtenerOrdenAtencionRedSalud'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'TipoClientePortalPrestador' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> TipoClientePortalPrestador'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'TipoClientePortalPrestador',N'*',N'1')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'1'
	where [Codigo]='TipoClientePortalPrestador' and [Servicio] = N'*'
	PRINT 'Actualizado -> TipoClientePortalPrestador'
END


IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
    WHERE P.[Codigo] = 'TimeOutSegClienteHttpPortalPrestador' AND P.[Servicio] = '*') 
BEGIN
    PRINT 'Creando -> TimeOutSegClienteHttpPortalPrestador'
    INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo],[Servicio],[Valor]) 
    VALUES (N'TimeOutSegClienteHttpPortalPrestador',N'*',N'140')
END
ELSE
BEGIN
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb] 
    SET  [Valor] = N'140'
	where [Codigo]='TimeOutSegClienteHttpPortalPrestador' and [Servicio] = N'*'
	PRINT 'Actualizado -> TimeOutSegClienteHttpPortalPrestador'
END














-- Scripts creados por Oscar Jiménez
-- PARÁMETROS PORTAL PRESTADORES
-- Sección generación de lotes

--cantidadDiasCaducadosOdasPorPagar
--cantidadDiasPorCaducarOdasPorPagar
--ordenEstadosOdasPorPagar

-- 1. Configuración generación de lotes de pago prestadores
-- a) Días caducados
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'CantidadDiasCaducadosOdasPorPagar' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> CantidadDiasCaducadosOdasPorPagar - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'CantidadDiasCaducadosOdasPorPagar', N'PortalPrestador', N'90')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - CantidadDiasCaducadosOdasPorPagar'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'90'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'CantidadDiasCaducadosOdasPorPagar'
END
-- b) Días por caducar
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'CantidadDiasPorCaducarOdasPorPagar' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> CantidadDiasPorCaducarOdasPorPagar - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'CantidadDiasPorCaducarOdasPorPagar', N'PortalPrestador', N'80')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - CantidadDiasPorCaducarOdasPorPagar'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'80'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'CantidadDiasPorCaducarOdasPorPagar'
END
-- c) Orden estados mostrar
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'OrdenEstadosOdasPorPagar' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> OrdenEstadosOdasPorPagar - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'OrdenEstadosOdasPorPagar', N'PortalPrestador', N'2,1,3')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - OrdenEstadosOdasPorPagar'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'2,1,3'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'OrdenEstadosOdasPorPagar'
END

-- 2. Mensaje informativo ODAs activas
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'MensajeOdasActivas' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> MensajeOdasActivas - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'MensajeOdasActivas', N'PortalPrestador', N'Estas ODAS están disponibles para el cobro automático.')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - MensajeOdasActivas'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'Estas ODAS están disponibles para el cobro automático.'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'MensajeOdasActivas'
END

-- 3. Mensaje informativo ODAs por caducar
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'MensajeOdasPorCaducar' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> MensajeOdasPorCaducar - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'MensajeOdasPorCaducar', N'PortalPrestador', N'Estas ODAS aún están activas, pero están próximas a caducar, por favor gestionarlas lo antes posible.')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - MensajeOdasPorCaducar'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'Estas ODAS aún están activas, pero están próximas a caducar, por favor gestionarlas lo antes posible.'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'MensajeOdasPorCaducar'
END

-- 3. Mensaje informativo ODAs caducadas
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'MensajeOdasCaducadas' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> MensajeOdasCaducadas - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'MensajeOdasCaducadas', N'PortalPrestador', N'Estas ODAS están caducadas y ya no están disponibles para el cobro automático, para poder gestionar el cobro por favor enviar un correo electrónico solicitando el requerimiento a convenios@saludsa.com.ec para la región Costa y conveniosuio@saludsa.com.ec para la región Sierra.')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - MensajeOdasCaducadas'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'Estas ODAS están caducadas y ya no están disponibles para el cobro automático, para poder gestionar el cobro por favor enviar un correo electrónico solicitando el requerimiento a convenios@saludsa.com.ec para la región Costa y conveniosuio@saludsa.com.ec para la región Sierra.'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'MensajeOdasCaducadas'
END


-- 4. Parámetro api ObtenerOrdenAtencionPorPagar
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiObtenerOrdenAtencionPorPagar' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiObtenerOrdenAtencionPorPagar - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiObtenerOrdenAtencionPorPagar', N'*', N'api/OrdenAtencion/Lote/ObtenerOrdenAtencionPorPagar')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiObtenerOrdenAtencionPorPagar'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/OrdenAtencion/Lote/ObtenerOrdenAtencionPorPagar'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiObtenerOrdenAtencionPorPagar'
END

-- 5. Parámetro api CrearLote
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiCrearLote' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiCrearLote - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiCrearLote', N'*', N'api/OrdenAtencion/Lote/CrearLote')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiCrearLote'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/OrdenAtencion/Lote/CrearLote'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiCrearLote'
END

-- 6. Parámetro api GenerarPdfLote
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiGenerarPdfLote' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiGenerarPdfLote - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiGenerarPdfLote', N'*', N'api/OrdenAtencion/Lote/GenerarPdfLote')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiGenerarPdfLote'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/OrdenAtencion/Lote/GenerarPdfLote'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiGenerarPdfLote'
END

-- 7. Parámetro api ObtenerLote
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiObtenerLote' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiObtenerLote - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiObtenerLote', N'*', N'api/OrdenAtencion/Lote/ObtenerLote')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiObtenerLote'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/OrdenAtencion/Lote/ObtenerLote'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiObtenerLote'
END


-- 8. Parámetro api Prestadores Médicos
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiPrestadorMedico' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiPrestadorMedico - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiPrestadorMedico', N'*', N'api/Prestadores/Medicos')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiPrestadorMedico'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/Prestadores/Medicos'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiPrestadorMedico'
END

-- 9. Parámetro para días de consulta de lotes
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'DiasConsultaLotes' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> DiasConsultaLotes - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'DiasConsultaLotes', N'PortalPrestador', N'180')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - DiasConsultaLotes'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'180'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'DiasConsultaLotes'
END

-- 10. Api autenticación tercero iniciar sesión
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiAutenticacionTerceroIniciarSesion' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiAutenticacionTerceroIniciarSesion - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiAutenticacionTerceroIniciarSesion', N'*', N'api/seguridad/IniciarSesion')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiAutenticacionTerceroIniciarSesion'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/seguridad/IniciarSesion'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiAutenticacionTerceroIniciarSesion'
END

-- 11. Api autenticación tercero cambiar contraseña
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiAutenticacionTerceroCambiarContrasenia' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiAutenticacionTerceroCambiarContrasenia - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiAutenticacionTerceroCambiarContrasenia', N'*', N'api/seguridad/CambiarContrasena')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiAutenticacionTerceroCambiarContrasenia'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/seguridad/CambiarContrasena'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiAutenticacionTerceroCambiarContrasenia'
END

-- 12. Api autenticación tercero restablecer contraseña
IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ApiAutenticacionTerceroRestablecerContrasenaPorRuc' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ApiAutenticacionTerceroRestablecerContrasenaPorRuc - *'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ApiAutenticacionTerceroRestablecerContrasenaPorRuc', N'*', N'api/seguridad/RestablecerContrasenaPorRuc')
END
ELSE
BEGIN
	PRINT 'Actualizado -> * - ApiAutenticacionTerceroRestablecerContrasenaPorRuc'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/seguridad/RestablecerContrasenaPorRuc'
	WHERE [Servicio] = '*' AND [Codigo] = 'ApiAutenticacionTerceroRestablecerContrasenaPorRuc'
END

---Obtenre pretador por convenio
  IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ObtenerPrestadorPorNumeroConvenio' AND P.[Servicio] = '*')
BEGIN
	PRINT 'Creando -> ObtenerPrestadorPorNumeroConvenio - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ObtenerPrestadorPorNumeroConvenio', N'-', N'api/Prestadores/ObtenerPrestadorPorNumeroConvenio')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - ObtenerPrestadorPorNumeroConvenio'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'api/Prestadores/ObtenerPrestadorPorNumeroConvenio'
	WHERE [Servicio] = '*' AND [Codigo] = 'ObtenerPrestadorPorNumeroConvenio'
END




-- 13. Configuración Lote Pago
  IF NOT EXISTS (SELECT 1 FROM [Saludsa].[Administracion].[ParametroServicioWeb] P 
WHERE P.[Codigo] = 'ConfiguracionLotePago' AND P.[Servicio] = 'PortalPrestador')
BEGIN
	PRINT 'Creando -> ConfiguracionLotePago - PortalPrestador'
	INSERT INTO [Saludsa].[Administracion].[ParametroServicioWeb] ([Codigo], [Servicio], [Valor])
	VALUES (N'ConfiguracionLotePago', N'PortalPrestador', N'{"cantidadDiasCaducados":90,"cantidadDiasPorCaducar":80,"estadosPagados":[1,2],"ordenEstados":[2,1,3]}')
END
ELSE
BEGIN
	PRINT 'Actualizado -> PortalPrestador - ConfiguracionLotePago'
	UPDATE [Saludsa].[Administracion].[ParametroServicioWeb]
	SET [Valor] = N'{"cantidadDiasCaducados":90,"cantidadDiasPorCaducar":80,"estadosPagados":[1,2],"ordenEstados":[2,1,3]}'
	WHERE [Servicio] = 'PortalPrestador' AND [Codigo] = 'ConfiguracionLotePago'
END


