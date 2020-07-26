package com.dlopez.persona.personaresource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dlopez.persona.bean.Persona;
import com.dlopez.persona.service.PersonaServiceInteface;


@RestController
public class PersonaResource {
	
	@Autowired
	private PersonaServiceInteface service;
	
	
	 @GetMapping(path="/personas")
	public List<Persona> getPersonas(){
		
		return service.getPersonas();
		
	}
	 
	 @PostMapping(path="/persona")
	public Persona savePersona(@RequestBody Persona persona){
		
		return service.savePersona(persona);
		
	}
	 
	 @GetMapping(path="/personas/{id}")
	public Persona findPersona(@PathVariable("id") Integer id){
		return service.findPersona(id);
	}
	
	@DeleteMapping(path = "/persona/{id}")
	public Persona deletePersona(Integer id){
		return service.deletePersona(id);
	}

}
