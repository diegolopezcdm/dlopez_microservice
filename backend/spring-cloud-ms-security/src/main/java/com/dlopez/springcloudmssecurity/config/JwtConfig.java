package com.dlopez.springcloudmssecurity.config;

import org.springframework.beans.factory.annotation.Value;

public class JwtConfig {

    @Value("${security.jwt.uri:/login/**}")
    private String uri;
    @Value("${security.jwt.header:Authorization}")
    private String header;
    @Value("${security.jwt.prefix:Bearer }")
    private String prefix;
    @Value("${security.jwt.expiration:#{1*60*60}}")
    private int expiration;
    @Value("${security.jwt.secret:JwtSecretKey}")
    private String secret;

    public void setUri(String uri){
        this.uri = uri;
    }

    public void setHeader(String header){
        this.header = header;
    }

    public void setPrefix(String prefix){
        this.prefix = prefix;
    }

    public void setExpiration(int expiration){
        this.expiration = expiration;
    }

    public void setSecret(String secret){
        this.secret = secret;
    }

    public String getSecret(){
        return this.secret;
    }

    public int getExpiration(){
        return this.expiration;
    }

    public String getPrefix(){
        return this.prefix;
    }

    public String getHeader(){
        return this.header;
    }

    public String getUri(){
        return this.uri;
    }

}