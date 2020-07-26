package com.dlopez.springcloudmspago.core.business;

import com.dlopez.springcloudmspago.dto.PagoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;

public interface PagoNegocioInterface {
	
	public TransaccionDto procesarPago(PagoDto pago);
 
}
