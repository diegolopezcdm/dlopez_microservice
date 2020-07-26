package com.dlopez.springcloudmspago.integracion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import com.dlopez.springcloudmspago.core.business.PagoNegocioInterface;
import com.dlopez.springcloudmspago.dto.PagoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;

@RestController
public class PagoRestController {
	
	
	@Autowired
	private PagoNegocioInterface service;
	
	@PostMapping(path = "/procesar/cargo/abono")
	public TransaccionDto generarCargoCuenta(@RequestBody PagoDto pago) {
		
		return service.procesarPago(pago);
		
	}

}
