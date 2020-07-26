package com.dlopez.springcloudmsconsulta.dto;

import java.math.BigDecimal;

public class DeudaDto {

    private String cliente;
	private String nombres;
	private String servicio;
	private BigDecimal monto;
	private String transaccion;
    private String estado;
    
    public String getCliente(){
        return this.cliente;
    }

    public String getNombres(){
        return this.nombres;
    }

    public String getServicio(){
        return this.servicio;
    }

    public BigDecimal getMonto(){
        return this.monto;
    }

    public String getTransaccion(){
        return this.transaccion;
    }

    public String getEstado(){
        return this.estado;
    }

    public void setEstado(String estado){
        this.estado = estado;
    }

    public void setTransaccion(String transaccion){
        this.transaccion = transaccion;
    }

    public void setMonto(BigDecimal monto){
        this.monto = monto;
    }

    public void setServicio(String servicio){
        this.servicio = servicio;
    }
    
    public void setNombres(String nombres){
        this.nombres = nombres;
    }

    public void setCliente(String cliente){
        this.cliente = cliente;
    }
    
}