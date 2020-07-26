package com.dlopez.springcloudmspago.core.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dlopez.springcloudmspago.core.dao.extservice.PagoCallAbonoDaoInterface;
import com.dlopez.springcloudmspago.core.dao.extservice.PagoCallCargoDaoInterface;
import com.dlopez.springcloudmspago.core.util.AppException;
import com.dlopez.springcloudmspago.core.util.Conexion;
import com.dlopez.springcloudmspago.dto.AbonoDto;
import com.dlopez.springcloudmspago.dto.CargoDto;
import com.dlopez.springcloudmspago.dto.TransaccionDto;


@Repository
public class PagoDao  implements PagoDaoInterface{
	
	@Autowired
	private Conexion con;
	
	@Autowired
	private PagoCallAbonoDaoInterface ssabono;
	
	@Autowired
	private PagoCallCargoDaoInterface sscargo;


	public String getTransaccionPago() throws AppException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String transaccion=null;
		try {
			con = new Conexion();
		} catch (Exception e) {
			throw new AppException(e.getMessage());
		}
	try {
		String SQL = "select nextval('SEQ_PAGO_ID') as id;";
		pstmt = con.getConexion().prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			transaccion = new Integer(rs.getInt("id")).toString();
			
		}
	} catch (Exception e) {
		throw new AppException(e.getMessage());
	} finally {
		try {
			con.closeResources(con.getConexion(), rs, null, null, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
			
				
		return transaccion;
	}

	@Override
	public TransaccionDto procesarAbono(AbonoDto abono) {
		// TODO Auto-generated method stub
		return ssabono.procesarAbono(abono);
	}

	@Override
	public TransaccionDto generarCargoCuenta(CargoDto datosCargo) {
		// TODO Auto-generated method stub
		return sscargo.generarCargoCuenta(datosCargo);
	}

}
