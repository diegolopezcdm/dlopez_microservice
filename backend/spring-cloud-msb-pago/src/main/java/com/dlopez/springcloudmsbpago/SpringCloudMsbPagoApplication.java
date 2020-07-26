package com.dlopez.springcloudmsbpago;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients("com.dlopez.springcloudmsbpago.dao")
public class SpringCloudMsbPagoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsbPagoApplication.class, args);
	}

}
