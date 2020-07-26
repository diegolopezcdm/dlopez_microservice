package com.dlopez.springcloudmscargo.core.dao;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dlopez.springcloudmscargo.core.util.AppException;
import com.dlopez.springcloudmscargo.core.util.Conexion;
import com.dlopez.springcloudmscargo.dto.TransaccionDto;

@Repository
public class CargoDao implements CargoDaoInterface{
	
	@Autowired
	private Conexion con;

	@Override
	public TransaccionDto generarCargoCuenta(String cuenta, BigDecimal monto, String cliente, String causal,
			String acreedor, String transaccion) throws AppException {
		TransaccionDto tx = new TransaccionDto();
		CallableStatement cstmt = null;
		String idTransaccion;
		String metodo = "";

		String SQL = "{? = call esq_ctas_clientes.fn_cargo_cuenta(?,?,?,?,?,?)}";
		try {
			con = new Conexion();
			con.getConexion().setAutoCommit(false);
			cstmt = con.getConexion().prepareCall(SQL);
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setString(2, cuenta);
			cstmt.setBigDecimal(3, monto);
			cstmt.setString(4, cliente);
			cstmt.setString(5, causal);
			cstmt.setString(6, acreedor);
			cstmt.setString(7, transaccion);
			cstmt.execute();
			String[] info = cstmt.getString(1).split("codtransaccion=");
			idTransaccion=info[1];
			if (idTransaccion!=null) {
				tx.setCodigo("000");
				tx.setDescripcion("Proceso Conforme");
				tx.setIdgenerado(idTransaccion);
			} else {
				tx.setCodigo("111");
				tx.setDescripcion("Error al procesar la transaccion");
			}
			con.getConexion().commit();
		} catch (SQLException sqle) {
			throw new AppException(sqle.getMessage());
		} catch (Exception e) {
			throw new AppException(e.getMessage());
		} finally {
			try {
				con.closeResources(con.getConexion(), null, null, cstmt, null);
			} catch (Exception e) {
				throw new AppException(e.getMessage());
			}
		}
		return tx;
	}

}
