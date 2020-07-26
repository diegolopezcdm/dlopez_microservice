package com.dlopez.springcloudmsconsulta;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients("com.dlopez.springcloudmsconsulta.dao")
public class SpringCloudMsConsultaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsConsultaApplication.class, args);
	}

}
