package com.dlopez.springcloudmscbconsulta.core.dao;

public class ParametrosMongo {
	private String hostname;
	private String port;
	private String db;
	private String usernamemongo;
	private String passwordmongo;
	
	public ParametrosMongo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ParametrosMongo(String hostname, String port, String db, String usernamemongo, String passwordmongo) {
		super();
		this.hostname = hostname;
		this.port = port;
		this.db = db;
		this.usernamemongo = usernamemongo;
		this.passwordmongo = passwordmongo;
	}
	
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getDb() {
		return db;
	}
	public void setDb(String db) {
		this.db = db;
	}
	public String getUsernamemongo() {
		return usernamemongo;
	}
	public void setUsernamemongo(String usernamemongo) {
		this.usernamemongo = usernamemongo;
	}
	public String getPasswordmongo() {
		return passwordmongo;
	}
	public void setPasswordmongo(String passwordmongo) {
		this.passwordmongo = passwordmongo;
	}
	
	
	

}