package com.dlopez.springcloudmsconsulta.dao;

import com.dlopez.springcloudmsconsulta.dto.DeudaDto;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name="pagolinea", url="${ms-consulta.uri}")
public interface ConsultaDeudaExternalInterface {

    @GetMapping(path = "/pagolinea/deuda/idCliente/{idCliente}/idServicio/{idServicio}")
    public DeudaDto consultaDeuda(@PathVariable("idCliente") String idCliente, @PathVariable("idServicio")String idServicio);

}