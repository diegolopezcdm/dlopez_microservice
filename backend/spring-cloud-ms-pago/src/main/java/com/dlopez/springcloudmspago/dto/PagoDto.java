package com.dlopez.springcloudmspago.dto;

import java.math.BigDecimal;

public class PagoDto {
	
	private String cuentacargo;
	private String cuentaabono;
	private BigDecimal monto; 
	private String causal;
	private String pagador;
	private String acreedor;

	

	public String getCuentacargo() {
		return cuentacargo;
	}
	public void setCuentacargo(String cuentacargo) {
		this.cuentacargo = cuentacargo;
	}
	public String getCuentaabono() {
		return cuentaabono;
	}
	public void setCuentaabono(String cuentaabono) {
		this.cuentaabono = cuentaabono;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
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
	public String getAcreedor() {
		return acreedor;
	}
	public void setAcreedor(String acreedor) {
		this.acreedor = acreedor;
	}


}
