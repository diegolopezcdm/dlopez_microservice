package com.dlopez.springcloudmsregisterdiscover;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class SpringCloudMsRegisterDiscoverApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsRegisterDiscoverApplication.class, args);
	}

}
