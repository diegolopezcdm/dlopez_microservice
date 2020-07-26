package com.dlopez.springcloudmsbconsulta.provider;

import com.dlopez.springcloudmsbconsulta.bean.Deuda;
import com.dlopez.springcloudmsbconsulta.consumer.DeudaConsumerBusInterface;
import com.dlopez.springcloudmsbconsulta.consumer.DeudaConsumerCBBusInterface;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

@RestController
public class PersonaBusRestController {

    @Autowired
    private DeudaConsumerBusInterface deudaConsumerBusInterface;

    @Autowired
    private DeudaConsumerCBBusInterface deudaConsumerCBBusInterface;
    
    @GetMapping(path="/deudas/idCliente/{idCliente}/idServicio/{idServicio}")
    @HystrixCommand(fallbackMethod = "consultaDeudaCB")
    public Deuda consultaDeuda(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio){
		return deudaConsumerBusInterface.consultaDeuda(idCliente, idServicio);
  }

  public Deuda consultaDeudaCB(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio){
    return deudaConsumerCBBusInterface.consultaDeuda(idCliente, idServicio);
  }
  
  
	 
}