package com.dlopez.persona.repository;

import java.util.List;

import com.dlopez.persona.bean.Persona;

public interface PersonaRepositoryInterface {
	public List<Persona> getPersonas();
	public Persona savePersona(Persona persona);
	public Persona findPersona(Integer id);
	public Persona deletePersona(Integer id);
}
