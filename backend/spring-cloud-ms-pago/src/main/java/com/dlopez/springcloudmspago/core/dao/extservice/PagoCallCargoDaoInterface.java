package com.dlopez.springcloudmspago.core.dao.extservice;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.dlopez.springcloudmspago.dto.CargoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;



@FeignClient(name="ms-cargo")
@RibbonClient(name="ms-cargo")
public interface PagoCallCargoDaoInterface {
	
	@PostMapping(path = "/mscargo/procesar/cargo/to/client")
	public TransaccionDto generarCargoCuenta(@RequestBody CargoDto datosCargo);

}
