package com.dlopez.springcloudmspago.core.dao.extservice;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.dlopez.springcloudmspago.dto.AbonoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;



@FeignClient(name="ms-abono")
@RibbonClient(name="ms-abono")
public interface PagoCallAbonoDaoInterface {
	
	@PostMapping(path = "/msabono/procesar/abono/to/recaudador")
    public TransaccionDto procesarAbono(@RequestBody AbonoDto abono);

}
