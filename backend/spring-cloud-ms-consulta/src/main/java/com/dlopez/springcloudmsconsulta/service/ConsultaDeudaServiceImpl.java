package com.dlopez.springcloudmsconsulta.service;

import com.dlopez.springcloudmsconsulta.dao.ConsultaDeudaDaoInterface;
import com.dlopez.springcloudmsconsulta.dto.DeudaDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ConsultaDeudaServiceImpl implements ConsultaDeudaServiceInterface{

    @Autowired
    private ConsultaDeudaDaoInterface consultaDao;

    public DeudaDto consultaDeuda(String idCliente, String idServicio){
        return consultaDao.consultaDeuda(idCliente, idServicio);
    }
    
}