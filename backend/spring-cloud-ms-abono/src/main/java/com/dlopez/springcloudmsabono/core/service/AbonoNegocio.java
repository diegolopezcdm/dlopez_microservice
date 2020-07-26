package com.dlopez.springcloudmsabono.core.service;

import java.math.BigDecimal;

import com.dlopez.springcloudmsabono.core.dao.AbonoInterface;
import com.dlopez.springcloudmsabono.core.util.AppException;
import com.dlopez.springcloudmsabono.dto.TransaccionDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AbonoNegocio implements AbonoNegocioInterface {

    @Autowired
    private AbonoInterface abonoInterface;

    @Override
    public TransaccionDto procesarAbono(String cuenta, BigDecimal monto, String cliente, String transaccion, String causal,
            String pagador) throws AppException {
        return abonoInterface.procesarAbono(cuenta, monto, cliente, transaccion, causal, pagador);
    }

}