package com.bsoftgroup.springbootpagolinea.core.interfaces;

import java.util.List;

import com.bsoftgroup.springbootpagolinea.core.negocio.bean.Deuda;
import com.bsoftgroup.springbootpagolinea.core.util.AppException;
import com.bsoftgroup.springbootpagolinea.core.util.Transaccion;

public interface FacturacionDaoInterface {
	
	public Deuda getDeuda(String cliente, String servicio) throws AppException;
	public Transaccion pagarDeuda(String cliente, String servicio, String transaccion) throws AppException;
	public Transaccion extornarServicio(String cliente, String servicio, String transaccion) throws AppException;


}
