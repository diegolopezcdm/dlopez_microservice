package com.bsoftgroup.springbootpagolinea.core.negocio.bean;

import java.math.BigDecimal;

public class Deuda {
	
	private String cliente;
	private String nombres;
	private String serivicio;
	private BigDecimal monto;
	private String transaccion;
	private String estado;
	
	
	public Deuda() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Deuda(String cliente, String nombres, String serivicio, BigDecimal monto, String transaccion,
			String estado) {
		super();
		this.cliente = cliente;
		this.nombres = nombres;
		this.serivicio = serivicio;
		this.monto = monto;
		this.transaccion = transaccion;
		this.estado = estado;
	}



	public Deuda(String cliente, String nombres, String serivicio, BigDecimal monto, String estado) {
		super();
		this.cliente = cliente;
		this.nombres = nombres;
		this.serivicio = serivicio;
		this.monto = monto;
		this.estado = estado;
	}



	public String getCliente() {
		return cliente;
	}


	public void setCliente(String cliente) {
		this.cliente = cliente;
	}


	public String getNombres() {
		return nombres;
	}


	public void setNombres(String nombres) {
		this.nombres = nombres;
	}


	public String getSerivicio() {
		return serivicio;
	}


	public void setSerivicio(String serivicio) {
		this.serivicio = serivicio;
	}


	public BigDecimal getMonto() {
		return monto;
	}


	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}


	public String getTransaccion() {
		return transaccion;
	}


	public void setTransaccion(String transaccion) {
		this.transaccion = transaccion;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	

}
