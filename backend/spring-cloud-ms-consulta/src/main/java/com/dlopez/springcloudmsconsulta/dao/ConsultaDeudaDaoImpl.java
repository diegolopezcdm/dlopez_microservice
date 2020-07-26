package com.dlopez.springcloudmsconsulta.dao;

import com.dlopez.springcloudmsconsulta.dto.DeudaDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultaDeudaDaoImpl implements ConsultaDeudaDaoInterface{

    @Autowired
    private ConsultaDeudaExternalInterface consultaExterna;

    public DeudaDto consultaDeuda(String idCliente, String idServicio){
        return consultaExterna.consultaDeuda(idCliente, idServicio);
    }

}