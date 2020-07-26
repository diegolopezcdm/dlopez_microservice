package com.bsoftgroup.springbootpagolinea.core.accesodato.repository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsoftgroup.springbootpagolinea.core.interfaces.FacturacionDaoInterface;
import com.bsoftgroup.springbootpagolinea.core.negocio.bean.Deuda;
import com.bsoftgroup.springbootpagolinea.core.util.AppException;
import com.bsoftgroup.springbootpagolinea.core.util.Conexion;
import com.bsoftgroup.springbootpagolinea.core.util.Transaccion;

@Repository
public class FacturacionDao implements FacturacionDaoInterface {

	public FacturacionDao() {
	}

	@Override
	public Deuda getDeuda(String cliente, String servicio) throws AppException {
		// TODO Auto-generated method stub
		
		Conexion con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Deuda deuda=null;
		try {
			con = new Conexion();
		} catch (Exception e) {
			throw new AppException(e.getMessage());
		}
	try {
		String SQL = "Select codigo,identificador,nombres,servicio,monto,transaccion,estado from esq_deudas.TBL_DEUDAS tb where tb.identificador=? and tb.servicio=? order by codigo";
		pstmt = con.getConexion().prepareStatement(SQL);
		pstmt.setString(1, cliente);
		pstmt.setString(2, servicio);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
		 deuda = new Deuda(
					rs.getString("identificador"), 
					rs.getString("nombres"), 
					rs.getString("servicio"), 
					rs.getBigDecimal("monto"), 
					rs.getString("transaccion"), 
					rs.getString("estado")
					);
			
			
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
			
				
		return deuda;
	}

	@Override
	public Transaccion pagarDeuda(String cliente, String servicio, String transaccion) throws AppException {
		// TODO Auto-generated method stub
		Transaccion tx = new Transaccion();
		PreparedStatement pstmt = null;
		Conexion con = null;
		String SQL = "UPDATE esq_deudas.TBL_DEUDAS  SET estado = '1', transaccion=? where identificador=? and servicio=?";
		try {
			con = new Conexion();
			con.getConexion().setAutoCommit(false);
			pstmt = con.getConexion().prepareStatement(SQL);
			pstmt.setString(1, transaccion);
			pstmt.setString(2, cliente);
			pstmt.setString(3, servicio);
			pstmt.executeUpdate();
			tx.setCodigo("0000");
			tx.setDescripcion("Proceso Conforme");
			con.getConexion().commit();
		} catch (SQLException sqle) {
			throw new AppException(sqle.getMessage());
		} catch (Exception e) {
			throw new AppException(e.getMessage());
		} finally {
			try {
				con.closeResources(con.getConexion(), null, null, null, pstmt);
			} catch (Exception e) {
				throw new AppException(e.getMessage());
			}
		}
		return tx;
	}

	@Override
	public Transaccion extornarServicio(String cliente, String servicio, String transaccion) throws AppException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
