package com.dlopez.springcloudmsbpersona.consumer;

import java.util.List;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;

import org.springframework.web.bind.annotation.GetMapping;

import com.dlopez.springcloudmsbpersona.bean.Persona;

@FeignClient(name="apigateway-internal")
@RibbonClient(name="ms-persona")
public interface PersonaConsumerBusInterface {

	@GetMapping(path="/ms-persona/mspersona/personas")
    public List<Persona> getPersonas();
      

}