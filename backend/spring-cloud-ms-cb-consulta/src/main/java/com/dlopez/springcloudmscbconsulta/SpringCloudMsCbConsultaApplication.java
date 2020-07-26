package com.dlopez.springcloudmscbconsulta;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class SpringCloudMsCbConsultaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsCbConsultaApplication.class, args);
	}

}
