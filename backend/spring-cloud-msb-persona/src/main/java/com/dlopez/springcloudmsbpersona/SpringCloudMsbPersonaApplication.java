package com.dlopez.springcloudmsbpersona;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients("com.dlopez.springcloudmsbpersona.consumer")
public class SpringCloudMsbPersonaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsbPersonaApplication.class, args);
	}

}
