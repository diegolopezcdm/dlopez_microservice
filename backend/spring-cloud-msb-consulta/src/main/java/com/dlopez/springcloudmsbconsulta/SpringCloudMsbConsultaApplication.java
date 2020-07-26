package com.dlopez.springcloudmsbconsulta;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients("com.dlopez.springcloudmsbconsulta.consumer")
@EnableHystrix
public class SpringCloudMsbConsultaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsbConsultaApplication.class, args);
	}

}
