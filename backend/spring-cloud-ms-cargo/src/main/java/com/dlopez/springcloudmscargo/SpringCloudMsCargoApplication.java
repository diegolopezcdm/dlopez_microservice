package com.dlopez.springcloudmscargo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class SpringCloudMsCargoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsCargoApplication.class, args);
	}

}
