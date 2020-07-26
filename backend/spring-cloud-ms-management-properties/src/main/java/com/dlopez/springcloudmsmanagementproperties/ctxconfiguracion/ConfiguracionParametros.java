package com.dlopez.springcloudmsmanagementproperties.ctxconfiguracion;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties("conexion")
public class ConfiguracionParametros {
    private String driverclassname;
    private String url;
    private String username;
    private String password;
    private String hostnamemongo; 
    private String portmongo; 
    private String dbmongo;
    private String usernamemongo;
    private String passwordmongo;

    public ConfiguracionParametros(){}

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


    public String getHostnamemongo(){
        return this.hostnamemongo;
    }

    public String getDbmongo(){
        return this.dbmongo;
    }

    public String getPortmongo(){
        return this.portmongo;
    }

    public String getUsernamemongo(){
        return this.usernamemongo;
    }

    public String getPasswordmongo(){
        return this.passwordmongo;
    }

    public void setHostnamemongo(String hostnamemongo){
        this.hostnamemongo = hostnamemongo;
    }

    public void setPortmongo(String portmongo){
        this.portmongo = portmongo;
    }

    public void setDbmongo(String dbmongo){
        this.dbmongo = dbmongo;
    }

    public void setUsernamemongo(String usernamemongo){
        this.usernamemongo = usernamemongo;
    }

    public void setPasswordmongo(String passwordmongo){
        this.passwordmongo = passwordmongo;
    }
}