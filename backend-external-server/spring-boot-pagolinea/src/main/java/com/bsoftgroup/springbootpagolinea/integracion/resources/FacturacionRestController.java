package com.bsoftgroup.springbootpagolinea.integracion.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bsoftgroup.springbootpagolinea.core.interfaces.FacturacionServiceInterface;
import com.bsoftgroup.springbootpagolinea.core.negocio.bean.Deuda;
import com.bsoftgroup.springbootpagolinea.core.util.AppException;
import com.bsoftgroup.springbootpagolinea.core.util.Transaccion;

@RestController
public class FacturacionRestController {

	@Autowired
	private FacturacionServiceInterface facturacionService;
	


	public FacturacionRestController() {
	}

	@GetMapping(path = "/deuda/idCliente/{idCliente}/idServicio/{idServicio}")
	public Deuda getDeuda(@PathVariable("idCliente") String cliente, @PathVariable("idServicio") String servicio) {
		
		//this.template.convertAndSend(Constantes.QUEUE_NAME, "FacturacionRestController.getServicios("+idCliente + ","+idEmpresa+")");
		// TODO Auto-generated method stub
		Deuda deuda=null;
		
		try {
			
			 return facturacionService.getDeuda(cliente, servicio);
			
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
      return deuda;
	}

	@GetMapping(path = "/deudapagar/idCliente/{idCliente}/idServicio/{idServicio}/idTransaccion/{idTransaccion}")
	public Transaccion insertarServicio(@PathVariable("idCliente") String cliente, @PathVariable("idServicio") String servicio,@PathVariable("idTransaccion") String idTransaccion) {
		Transaccion tx = new Transaccion();
		try {
			tx = facturacionService.pagarDeuda(cliente, servicio,idTransaccion);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tx;
	}
	
	@PutMapping(path = "/deudapagar")
	public Transaccion pagarDeuda(@RequestBody DtoDeuda deuda) {
		Transaccion tx = new Transaccion();
		System.out.println(deuda.getIdCliente()+"-"+deuda.getIdServicio()+"-"+deuda.getIdTransaccion());
		try {
			tx = facturacionService.pagarDeuda(deuda.getIdCliente(),deuda.getIdServicio(), deuda.getIdTransaccion());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tx;
	}



}
