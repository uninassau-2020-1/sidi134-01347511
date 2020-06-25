package com.projetoSD.projetoSD.model.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.projetoSD.projetoSD.model.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Optional<Usuario> findByUsername(String username);

    Usuario findUserByUsernameEquals(String username);

}

