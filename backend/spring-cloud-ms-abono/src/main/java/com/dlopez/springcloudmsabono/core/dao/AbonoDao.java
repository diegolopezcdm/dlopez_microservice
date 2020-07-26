package com.dlopez.springcloudmsabono.core.dao;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.SQLException;

import com.dlopez.springcloudmsabono.core.util.AppException;
import com.dlopez.springcloudmsabono.core.util.Conexion;
import com.dlopez.springcloudmsabono.dto.TransaccionDto;

import org.springframework.stereotype.Repository;

@Repository
public class AbonoDao implements AbonoInterface {

    @Override
    public TransaccionDto procesarAbono(String cuenta, BigDecimal monto, String cliente, String transaccion, String causal,
            String pagador) throws AppException {
        // TODO Auto-generated method stub
		TransaccionDto tx = new TransaccionDto();
		CallableStatement cstmt = null;
		String idTransaccion;
		String metodo = "";
		Conexion con = null;
		String SQL = "{? = call esq_ctas_recaudadoras.fn_abono_cuenta(?,?,?,?,?,?)}";
		try {
			con = new Conexion();
			con.getConexion().setAutoCommit(false);
			cstmt = con.getConexion().prepareCall(SQL);
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setString(2, cuenta);
			cstmt.setBigDecimal(3, monto);
			cstmt.setString(4, cliente);
			cstmt.setString(5, transaccion);
			cstmt.setString(6, causal);
			cstmt.setString(7, pagador);
			cstmt.execute();
			idTransaccion = cstmt.getString(1);
			if (idTransaccion.contains("000")) {
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

