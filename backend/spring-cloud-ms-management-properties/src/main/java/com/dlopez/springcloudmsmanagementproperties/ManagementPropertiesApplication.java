package com.dlopez.springcloudmsmanagementproperties;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ManagementPropertiesApplication {

	public static void main(String[] args) {
		SpringApplication.run(ManagementPropertiesApplication.class, args);
	}

}
