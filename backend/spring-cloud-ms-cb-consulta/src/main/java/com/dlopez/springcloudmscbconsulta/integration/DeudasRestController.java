package com.dlopez.springcloudmscbconsulta.integration;

import com.dlopez.springcloudmscbconsulta.core.service.DeudaService;
import com.dlopez.springcloudmscbconsulta.dto.DeudaDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class DeudasRestController {
	
	@Autowired
	private DeudaService service;
	
	@GetMapping(path="/deudas/idCliente/{idCliente}/idServicio/{idServicio}")
    public DeudaDto getDeudasMongoDB(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio){
		    return service.getDeuda(idCliente, idServicio);
		    
		   
	}

}