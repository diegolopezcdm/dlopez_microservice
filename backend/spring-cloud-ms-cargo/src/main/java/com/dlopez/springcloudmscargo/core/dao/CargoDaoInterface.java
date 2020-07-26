package com.dlopez.springcloudmscargo.core.dao;

import java.math.BigDecimal;

import com.dlopez.springcloudmscargo.core.util.AppException;
import com.dlopez.springcloudmscargo.dto.TransaccionDto;

public interface CargoDaoInterface {
	
	public TransaccionDto generarCargoCuenta(String cuenta, BigDecimal monto,String cliente,String causal,String acreedor,String transaccion) throws AppException;

}
