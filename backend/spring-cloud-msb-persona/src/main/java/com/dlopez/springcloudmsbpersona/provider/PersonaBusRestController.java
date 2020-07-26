package com.dlopez.springcloudmsbpersona.provider;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;

import com.dlopez.springcloudmsbpersona.bean.Persona;
import com.dlopez.springcloudmsbpersona.consumer.PersonaConsumerBusInterface;

@RestController
public class PersonaBusRestController {

    @Autowired
    private PersonaConsumerBusInterface personaConsumerBusInterface;
    
    @GetMapping(path="/personas")
	public List<Persona> getPersonas(){
		return personaConsumerBusInterface.getPersonas();
	}
	 
}