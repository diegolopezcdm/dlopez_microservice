package com.dlopez.springcloudmsbpago.integracion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dlopez.springcloudmsbpago.dao.PagoInterface;
import com.dlopez.springcloudmsbpago.dto.PagoDto;
import com.dlopez.springcloudmsbpago.dto.TransaccionDto;
@RestController
public class PagoBusRestController {
	
	@Autowired
	private PagoInterface pagoservice;
	
	
	@PostMapping(path = "/procesar/cargo/abono")
	public TransaccionDto generarCargoCuenta(@RequestBody PagoDto pago) {
		
		return pagoservice.generarCargoCuenta(pago);
		
	}

}
