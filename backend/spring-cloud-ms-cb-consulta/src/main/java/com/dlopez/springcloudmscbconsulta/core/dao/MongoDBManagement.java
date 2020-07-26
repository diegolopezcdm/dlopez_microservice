package com.dlopez.springcloudmscbconsulta.core.dao;


import org.springframework.stereotype.Repository;
import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dlopez.springcloudmscbconsulta.dto.DeudaDto;
import com.google.gson.Gson;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

@Repository
public class MongoDBManagement {
	
	        @Autowired
            private ConexionMongo conexion;
	        
	        
			private static final Logger log = LoggerFactory.getLogger(MongoDBManagement.class);

            
            public MongoDBManagement() {
            	
            }
		    public  DeudaDto getDocument(String idCliente, String idServicio) {
				log.info("informacion {}", "getDocument");
				log.info("informacion {}", "idCliente " + idCliente);
		    	log.info("informacion {}", "idServicio " + idServicio);

		    	DeudaDto deuda=null;
				 FindIterable<Document> fi=conexion.getDataBase().getCollection("deudas").
				 	find(Filters.and(Filters.eq("cliente", idCliente),Filters.eq("servicio", idServicio)));

				log.info("proceso consulta");
		        MongoCursor<Document> cursor = fi.iterator();
		        try {
		            while(cursor.hasNext()) {
		                String info = cursor.next().toJson();
		                System.out.println("INGRESO "+info);
		                deuda = new Gson().fromJson(info, DeudaDto.class);		               	           
		                
		            }
		        }catch (Exception e) {
					// TODO: handle exception
		        	e.printStackTrace();
				} finally {
		            cursor.close();
		            
		        }
		        log.info("salio del proceso");
		        return deuda;
		    }
		    

}