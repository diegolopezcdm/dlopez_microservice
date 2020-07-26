package com.dlopez.persona.repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dlopez.persona.bean.Persona;


@Repository
public class PersonaRepository implements PersonaRepositoryInterface {
	private static List<Persona> personas;
	private static Integer id = 3;
	
	static {
		personas =  new ArrayList<>();
		personas.add(new Persona(1,"Jose Diaz"));
		personas.add(new Persona(2,"Miguel Diaz"));
		personas.add(new Persona(3,"Bruno Diaz"));
	}

	public PersonaRepository(){}

	public List<Persona> getPersonas(){
		
		return personas;
	}
	
	public Persona savePersona(Persona persona) {
		if(persona.getId()==null) {
			persona.setId(++id);
		}
		personas.add(persona);
		return persona;
	}
	
	public Persona findPersona(Integer id) {
		Persona persona = null;
		for(Persona personaTmp:personas) {
			 if(personaTmp.getId()==id) {
				 persona=personaTmp;
			 }
		}
		
		return persona;
	}
	
	public com.dlopez.persona.bean.Persona deletePersona(Integer id) {
		Iterator<Persona> itpersona = personas.iterator();
		while(itpersona.hasNext()) {
			Persona persona = (Persona)itpersona.next();
			if(persona.getId()==id) {
				itpersona.remove();
				return persona;
			}
		}
		return null;
	}

}
