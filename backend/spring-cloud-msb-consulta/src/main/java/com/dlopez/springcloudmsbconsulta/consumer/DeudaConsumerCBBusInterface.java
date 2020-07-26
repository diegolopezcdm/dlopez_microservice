package com.dlopez.springcloudmsbconsulta.consumer;

import com.dlopez.springcloudmsbconsulta.bean.Deuda;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@FeignClient(name="apigateway-internal")
@RibbonClient(name="ms-cb-consulta")
public interface DeudaConsumerCBBusInterface {

	@GetMapping(path="/ms-cb-consulta/mscbconsulta/deudas/idCliente/{idCliente}/idServicio/{idServicio}")
    public Deuda consultaDeuda(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio);

      

}