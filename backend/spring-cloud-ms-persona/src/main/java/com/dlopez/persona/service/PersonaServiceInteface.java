package com.dlopez.persona.service;

import java.util.List;

import com.dlopez.persona.bean.Persona;

public interface PersonaServiceInteface {
	
	public List<Persona> getPersonas();
	public Persona savePersona(Persona persona);
	public Persona findPersona(Integer id);
	public Persona deletePersona(Integer id);

}
