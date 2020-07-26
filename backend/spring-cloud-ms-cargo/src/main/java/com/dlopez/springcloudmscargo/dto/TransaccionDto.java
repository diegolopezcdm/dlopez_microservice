package com.dlopez.springcloudmscargo.dto;

public class TransaccionDto {

	private String codigo;
	private String descripcion;
	private String idgenerado;
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getIdgenerado() {
		return idgenerado;
	}
	public void setIdgenerado(String idgenerado) {
		this.idgenerado = idgenerado;
	}
	
}
