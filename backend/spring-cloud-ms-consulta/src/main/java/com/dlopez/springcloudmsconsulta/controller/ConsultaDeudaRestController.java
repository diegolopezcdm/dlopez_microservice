package com.dlopez.springcloudmsconsulta.controller;

import com.dlopez.springcloudmsconsulta.dto.DeudaDto;
import com.dlopez.springcloudmsconsulta.service.ConsultaDeudaServiceInterface;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConsultaDeudaRestController {

    @Autowired
    private ConsultaDeudaServiceInterface consultaService;

    @GetMapping(path = "/deudas/idCliente/{idCliente}/idServicio/{idServicio}")
    public DeudaDto consultaDeuda(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio){
        return consultaService.consultaDeuda(idCliente, idServicio);
    }

    

}