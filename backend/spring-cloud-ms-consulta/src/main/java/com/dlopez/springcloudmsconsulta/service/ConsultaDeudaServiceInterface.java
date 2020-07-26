package com.dlopez.springcloudmsconsulta.service;

import com.dlopez.springcloudmsconsulta.dto.DeudaDto;

public interface ConsultaDeudaServiceInterface {

    public DeudaDto consultaDeuda(String idCliente, String idServicio);
    
}