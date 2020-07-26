package com.dlopez.springcloudmsmanagementproperties.integracion.parametros;

public class DatosConexionMongo {

    private String hostname;
    private String port;
    private String db;
    private String usernamemongo;
    private String passwordmongo;

    public DatosConexionMongo(){}

    public DatosConexionMongo(String hostname,
    String port,
    String db,
    String usernamemongo,
    String passwordmongo){
        this.hostname = hostname;
        this.port = port;
        this.db = db;
        this.usernamemongo = usernamemongo;
        this.passwordmongo = passwordmongo;
    }

    public String getHostname(){
        return this.hostname;
    }

    public String getPort(){
        return this.port;
    }

    public String getDb(){
        return this.db;
    }

    public void setHostname(String hostname){
        this.hostname = hostname;
    }

    public void setPort(String port){
        this.port = port;
    }

    public void setDb(String db){
        this.db = db;
    }


    public String getUsernamemongo(){
        return this.usernamemongo;
    }

    public String getPasswordmongo(){
        return this.passwordmongo;
    }

    public void setUsernamemongo(String usernamemongo){
        this.usernamemongo = usernamemongo;
    }

    public void setPasswordmongo(String passwordmongo){
        this.passwordmongo = passwordmongo;
    }

}