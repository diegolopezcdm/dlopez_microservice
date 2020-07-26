package com.dlopez.springcloudmsabono.integration;

import com.dlopez.springcloudmsabono.core.service.AbonoNegocioInterface;
import com.dlopez.springcloudmsabono.core.util.AppException;
import com.dlopez.springcloudmsabono.dto.AbonoDto;
import com.dlopez.springcloudmsabono.dto.TransaccionDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AbonoRestController {

    @Autowired
    AbonoNegocioInterface abonoNegocioInterface;

    @PostMapping(path = "/procesar/abono/to/recaudador")
    public TransaccionDto procesarAbono(@RequestBody AbonoDto abono) throws AppException {
        return abonoNegocioInterface.procesarAbono(abono.getCuenta(), abono.getMonto(), 
        abono.getCliente(), abono.getTransaccion(), abono.getCausal(), abono.getPagador());

    }

}