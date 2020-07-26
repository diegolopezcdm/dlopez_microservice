package com.dlopez.springcloudmsmanagementproperties.integracion.parametros;

public class DatosConexionPostgres {

    private String driverclassname;
    private String url;
    private String username;
    private String password;

    public DatosConexionPostgres(){}

    public DatosConexionPostgres(String driverclassname,
    String url,
    String username,
    String password){
        this.driverclassname = driverclassname;
        this.url = url;
        this.username = username;
        this.password = password;
    }


    public String getDriverclassname(){
        return this.driverclassname;
    }

    public String getUrl(){
        return this.url;
    }

    public String getUsername(){
        return this.username;
    }

    public String getPassword(){
        return this.password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public void setUrl(String url){
        this.url = url;
    }

    public void setDriverclassname(String driverclassname){
        this.driverclassname = driverclassname;
    }

}