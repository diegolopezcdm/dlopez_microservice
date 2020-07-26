package com.dlopez.springcloudmsconsulta.dao;

import com.dlopez.springcloudmsconsulta.dto.DeudaDto;

public interface ConsultaDeudaDaoInterface {

    public DeudaDto consultaDeuda(String idCliente, String idServicio);
    
}