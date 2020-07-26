package com.dlopez.springcloudmscargo.core.business;

import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlopez.springcloudmscargo.core.dao.CargoDaoInterface;
import com.dlopez.springcloudmscargo.core.util.AppException;
import com.dlopez.springcloudmscargo.dto.TransaccionDto;

@Service
public class CargoNegocio implements CargoNegocioInterface{
	
	
	@Autowired
	private CargoDaoInterface dao;

	@Override
	public TransaccionDto generarCargoCuenta(String cuenta, BigDecimal monto, String cliente, String causal,
			String acreedor, String transaccion) throws AppException {
		// TODO Auto-generated method stub
		
		return dao.generarCargoCuenta(cuenta, monto, cliente, causal, acreedor, transaccion);
		
	}



}
