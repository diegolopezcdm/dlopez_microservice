package com.dlopez.persona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlopez.persona.bean.Persona;
import com.dlopez.persona.repository.PersonaRepositoryInterface;


@Service
public class PersonaService  implements PersonaServiceInteface{

	@Autowired
	private PersonaRepositoryInterface repository;
	
	
	public PersonaService(){}
	
	public List<Persona> getPersonas() {
		// TODO Auto-generated method stub
		return repository.getPersonas();
	}


	public Persona savePersona(Persona persona) {
		// TODO Auto-generated method stub
		return repository.savePersona(persona);
	}


	public Persona findPersona(Integer id) {
		// TODO Auto-generated method stub
		return repository.findPersona(id);
	}


	public Persona deletePersona(Integer id) {
		// TODO Auto-generated method stub
		return repository.deletePersona(id);
	}
	

}
