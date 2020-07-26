package com.dlopez.springcloudmspago.core.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlopez.springcloudmspago.core.dao.PagoDaoInterface;
import com.dlopez.springcloudmspago.core.util.AppException;
import com.dlopez.springcloudmspago.dto.AbonoDto;
import com.dlopez.springcloudmspago.dto.CargoDto;
import com.dlopez.springcloudmspago.dto.PagoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;

@Service
public class PagoNegocio implements PagoNegocioInterface {
	
	@Autowired
	private PagoDaoInterface dao;

	@Override
	public TransaccionDto procesarPago(PagoDto pago) {
		// TODO Auto-generated method stub
		TransaccionDto tx =  new TransaccionDto();
		String transaccion=null;
		try {
			transaccion = dao.getTransaccionPago();
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tx.setCodigo("898");
			tx.setDescripcion("Error al generar id de transacción única");
			
			
			return tx; 
		}
		
		
		
		CargoDto cargo  =  new CargoDto();
		
		
		cargo.setAcreedor(pago.getAcreedor());
		cargo.setCausal(pago.getCausal());
		cargo.setCliente(pago.getPagador());
		cargo.setCuenta(pago.getCuentacargo());
		cargo.setMonto(pago.getMonto());
		cargo.setTransaccion(transaccion);
		
		TransaccionDto txcargo = dao.generarCargoCuenta(cargo);
		
		if(txcargo.getCodigo().equals("000")) {
			
			AbonoDto abono = new AbonoDto();
			abono.setCausal(pago.getCausal());
			abono.setCliente(pago.getAcreedor());
			abono.setCuenta(pago.getCuentaabono());
			abono.setMonto(pago.getMonto());
			abono.setPagador(pago.getPagador());
			abono.setTransaccion(transaccion);
			
			TransaccionDto txabono = dao.procesarAbono(abono);
			
			if(txabono.getCodigo().equals("000")) {
				
				tx.setCodigo("000");
				tx.setDescripcion("Proceso de Cargo y Abono Conforme");
				tx.setIdgenerado(transaccion);
				return tx;
				
			}else {
				
				tx.setCodigo("698");
				tx.setDescripcion("Error al procesar el abono");
				return tx;
			}
			
		}else {
			
			tx.setCodigo("697");
			tx.setDescripcion("Error al procesar el cargo");
			return tx;
		}
		
	}

}
