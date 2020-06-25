package com.projetoSD.projetoSD.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projetoSD.projetoSD.model.entity.Municipio;
import com.projetoSD.projetoSD.model.repository.MunicipioRepository;

@Service
public class MunicipioService {
	
	@Autowired
	private MunicipioRepository repository;

	
	public Optional<Municipio> findByCodigo(Long codigo) {
		return this.repository.findById(codigo);
	}
	
	@Transactional
    public void remover(Long id) {
	this.repository.deleteById(id);
    }

	
	public List<Municipio> findAll() {
		
		return this.repository.findAll();
	}

}
