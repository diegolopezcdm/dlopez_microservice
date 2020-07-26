package com.dlopez.springcloudmspago.dto;

import java.math.BigDecimal;

public class AbonoDto {
	private String cuenta; 
	private BigDecimal monto; 
	private String cliente; 
	private String transaccion; 
	private String causal;
	private String pagador;
	public String getCuenta() {
		return cuenta;
	}
	public void setCuenta(String cuenta) {
		this.cuenta = cuenta;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getTransaccion() {
		return transaccion;
	}
	public void setTransaccion(String transaccion) {
		this.transaccion = transaccion;
	}
	public String getCausal() {
		return causal;
	}
	public void setCausal(String causal) {
		this.causal = causal;
	}
	public String getPagador() {
		return pagador;
	}
	public void setPagador(String pagador) {
		this.pagador = pagador;
	}
	
	
}
