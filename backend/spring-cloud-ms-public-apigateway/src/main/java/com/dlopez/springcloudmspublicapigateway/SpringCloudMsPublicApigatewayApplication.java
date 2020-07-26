package com.dlopez.springcloudmspublicapigateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
@EnableDiscoveryClient
public class SpringCloudMsPublicApigatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudMsPublicApigatewayApplication.class, args);
	}

}
