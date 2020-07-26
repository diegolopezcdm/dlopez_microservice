package com.bsoftgroup.springbootpagolinea.core.negocio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoftgroup.springbootpagolinea.core.interfaces.FacturacionDaoInterface;
import com.bsoftgroup.springbootpagolinea.core.interfaces.FacturacionServiceInterface;
import com.bsoftgroup.springbootpagolinea.core.negocio.bean.Deuda;
import com.bsoftgroup.springbootpagolinea.core.util.AppException;
import com.bsoftgroup.springbootpagolinea.core.util.Transaccion;


@Service
public class FacturacionService implements FacturacionServiceInterface{
	
	@Autowired
	private FacturacionDaoInterface facturacionDao;

	@Override
	public Deuda getDeuda(String cliente, String servicio) throws AppException {
		// TODO Auto-generated method stub
		return facturacionDao.getDeuda(cliente, servicio);
	}

	@Override
	public Transaccion pagarDeuda(String cliente, String servicio, String transaccion) throws AppException {
		// TODO Auto-generated method stub
		return facturacionDao.pagarDeuda(cliente, servicio,transaccion);
	}

	@Override
	public Transaccion extornarServicio(String cliente, String servicio,String transaccion) throws AppException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
