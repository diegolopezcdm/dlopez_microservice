package com.dlopez.springcloudmsbpago.dao;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.dlopez.springcloudmsbpago.dto.PagoDto;
import com.dlopez.springcloudmsbpago.dto.TransaccionDto;


@FeignClient(name="apigateway-internal")
@RibbonClient(name="ms-pago")
public interface PagoInterface {
	
	@PostMapping(path = "/ms-pago/mspago/procesar/cargo/abono")
	public TransaccionDto generarCargoCuenta(@RequestBody PagoDto pago);

}
