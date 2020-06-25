package com.projetoSD.projetoSD.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.projetoSD.projetoSD.model.entity.Usuario;
import com.projetoSD.projetoSD.model.repository.UsuarioRepository;

@Service
public class JwtInMemoryUserDetailsService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	Optional<Usuario> usuarioLogado = this.usuarioRepository.findByUsername(username);

	if (!usuarioLogado.isPresent()) {
	    throw new UsernameNotFoundException(String.format("USER_NOT_FOUND '%s'.", username));
	}

	return usuarioLogado.get();
    }

}

