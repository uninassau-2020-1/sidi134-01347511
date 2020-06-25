package com.projetoSD.projetoSD.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.projetoSD.projetoSD.model.entity.Municipio;
import com.projetoSD.projetoSD.service.MunicipioService;

@RestController
public class MunicipioController {
	
	@Autowired
	MunicipioService service;

	@GetMapping("/{codigo}")
	public Optional<Municipio> getInfoMunicipios(@PathVariable("codigo") Long codigo) {
		return this.service.findByCodigo(codigo);
		
	}
	
	@GetMapping("/all")
	public List<Municipio> getInfoAllMunicipios() {
		 
		return this.service.findAll();
		
	}
	
    @DeleteMapping("/{id}")
    public ResponseEntity<Municipio> excluir(@PathVariable Long id) {
	this.service.remover(id);
	return ResponseEntity.noContent().build();
    }

	
	@GetMapping("/")
	public String getInfoMunicipios() {
		return "OK";
		
	}
}
