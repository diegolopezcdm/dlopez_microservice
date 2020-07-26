package com.dlopez.springcloudmscbconsulta.core.service;

import com.dlopez.springcloudmscbconsulta.dto.DeudaDto;

public interface DeudaServiceInterface {
	
	public DeudaDto getDeuda(String idCliente,String idServicio);

}