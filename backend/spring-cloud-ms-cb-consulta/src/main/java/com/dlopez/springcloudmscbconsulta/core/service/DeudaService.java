package com.dlopez.springcloudmscbconsulta.core.service;

import com.dlopez.springcloudmscbconsulta.core.dao.MongoDBManagement;
import com.dlopez.springcloudmscbconsulta.dto.DeudaDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeudaService implements DeudaServiceInterface {
	
	@Autowired
	private MongoDBManagement dao;

	@Override
	public DeudaDto getDeuda(String idCliente, String idServicio) {
		// TODO Auto-generated method stub
		return dao.getDocument(idCliente, idServicio);
	}

}