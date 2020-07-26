package com.dlopez.springcloudmscbconsulta.core.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

@Component
public class ConexionMongo {
	
	// private MongoClient mongoClient;    // Java MongoDB client (Cliente Java MongoDB)
	// private MongoDatabase mongodb;
	 private ParametrosMongo parametros;
	 private MongoDatabase database;
	 private MongoClient mongoClient;
	 
	private static final Logger log = LoggerFactory.getLogger(ConexionMongo.class);

	 
	 public ConexionMongo() {
		 ResponseEntity<ParametrosMongo> responseEntity = new RestTemplate().getForEntity("http://localhost:8084/mproperties/datosconexion/mongo",ParametrosMongo.class);
		 this.parametros = responseEntity.getBody();
		 this.createConexionDataBase();
		 log.info("se conecto a la db mongo {} ", this.parametros.getDb());
		 
	 }
	 
	 private void createConexionDataBase() {
		 log.info("iniciando conexion a la db mongo {} ", this.parametros.getDb());
		 this.mongoClient = MongoClients.create( "mongodb://"+this.parametros.getUsernamemongo()+":"+ this.parametros.getPasswordmongo()+"@"+this.parametros.getHostname()+":"+this.parametros.getPort()+"/"+this.parametros.getDb()+"?retryWrites=true&heartbeatFrequencyMS=10000");
		
		 this.database = mongoClient.getDatabase(this.parametros.getDb());
		 //&heartbeatFrequencyMS=10000
		 
	 }
	 
	 public MongoDatabase getDataBase() {
		 return database;
	 }
	 public void CloseConexion() {
		  this.mongoClient.close();
		 
	 }

}