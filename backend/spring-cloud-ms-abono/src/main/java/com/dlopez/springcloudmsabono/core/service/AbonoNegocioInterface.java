package com.dlopez.springcloudmsabono.core.service;

import java.math.BigDecimal;

import com.dlopez.springcloudmsabono.core.util.AppException;
import com.dlopez.springcloudmsabono.dto.TransaccionDto;

public interface AbonoNegocioInterface {

    public TransaccionDto procesarAbono(String cuenta, BigDecimal monto, String cliente, String transaccion, String causal,
			String pagador) throws AppException;

}