package com.projetoSD.projetoSD.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@Entity
@Table(name = "municipio")
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Municipio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_municipio")
	private Long cod_municipio;
	
	@Column(name = "nome_municipio")
	private String nome_municipio;
	
	@Column(name = "part_ocupados")
	private String part_ocupados;
	
	@Column(name = "part_nao_ocupados_fechados")
	private String part_nao_ocupados_fechados;
	
	@Column(name = "part_nao_ocupados_ocasional")
	private String part_nao_ocupados_ocasional;
	
	@Column(name = "part_nao_ocupados_vagos")
	private String part_nao_ocupados_vagos;
	
	@Column(name = "total_particulares")
	private String total_particulares;
	
	@Column(name = "total_coletivos")
	private String total_coletivos;
	
	@Column(name = "coletivos_morador")
	private String coletivos_morador;
	
	@Column(name = "coletivos_sem_morador")
	private String coletivos_sem_morador;
	
}
