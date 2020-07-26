package com.dlopez.springcloudmspago.core.dao;

import org.springframework.web.bind.annotation.RequestBody;

import com.dlopez.springcloudmspago.core.util.AppException;
import com.dlopez.springcloudmspago.dto.AbonoDto;
import com.dlopez.springcloudmspago.dto.CargoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;

public interface PagoDaoInterface {
	
	public String getTransaccionPago() throws AppException;
	
	public TransaccionDto procesarAbono(@RequestBody AbonoDto abono);
	
	public TransaccionDto generarCargoCuenta(@RequestBody CargoDto datosCargo);

}
