package com.dlopez.springcloudmsmanagementproperties.integracion.resproperties;

import com.dlopez.springcloudmsmanagementproperties.ctxconfiguracion.ConfiguracionParametros;
import com.dlopez.springcloudmsmanagementproperties.integracion.parametros.DatosConexionMongo;
import com.dlopez.springcloudmsmanagementproperties.integracion.parametros.DatosConexionPostgres;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DatosConexionController {

@Autowired
private ConfiguracionParametros service;
    
    @GetMapping(path="datosconexion")
    public DatosConexionPostgres getDatosConexion() {
    DatosConexionPostgres datosconexionpostgres= new DatosConexionPostgres(service.getDriverclassname(), 
        service.getUrl(), service.getUsername(), service.getPassword());
    return datosconexionpostgres;
    }

    @GetMapping(path="datosconexion/mongo")
    public DatosConexionMongo getDatosConexionMongo() {
        DatosConexionMongo datosconexionpostgresMongo= new DatosConexionMongo(service.getHostnamemongo(), 
        service.getPortmongo(), service.getDbmongo(), service.getUsernamemongo(), service.getPasswordmongo());
    return datosconexionpostgresMongo;
    }
}