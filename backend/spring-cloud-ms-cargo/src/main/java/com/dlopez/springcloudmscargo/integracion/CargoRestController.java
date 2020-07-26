package com.dlopez.springcloudmscargo.integracion;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dlopez.springcloudmscargo.core.business.CargoNegocioInterface;
import com.dlopez.springcloudmscargo.core.util.AppException;
import com.dlopez.springcloudmscargo.dto.CargoDto;
import com.dlopez.springcloudmscargo.dto.TransaccionDto;

@RestController
public class CargoRestController {
	
	@Autowired
	private CargoNegocioInterface service;
	
	
	@PostMapping(path = "/procesar/cargo/to/client")
	public TransaccionDto generarCargoCuenta(@RequestBody CargoDto datosCargo) throws AppException {
		TransaccionDto tx;
		String cuenta=datosCargo.getCuenta();
		BigDecimal monto=datosCargo.getMonto();
		String cliente=datosCargo.getCliente();
		String causal=datosCargo.getCausal();
		String acreedor=datosCargo.getAcreedor();
		String transaccion=datosCargo.getTransaccion();
		try {
			tx = service.generarCargoCuenta(cuenta, monto, cliente, causal, acreedor, transaccion);
		}catch (Exception e) {
			
			tx= new TransaccionDto();
			tx.setCodigo("111");
			tx.setDescripcion("Error interno en el proceso");
			throw new AppException(e.getMessage());
		}
		
		return tx;
	}
	

}
