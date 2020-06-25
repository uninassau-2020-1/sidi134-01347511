package com.projetoSD.projetoSD.security;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.projetoSD.projetoSD.model.entity.Usuario;
import com.projetoSD.projetoSD.model.repository.UsuarioRepository;
import com.projetoSD.projetoSD.service.UsuarioService;

@RestController
@CrossOrigin(origins = "*")
public class JwtAuthenticationRestController {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UsuarioRepository users;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UsuarioService usuarioService;
    
    @Autowired
    private UsuarioRepository usuarioRepository;

    @PostMapping("/authenticate")
    public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtTokenRequest authenticationRequest)
	    throws AuthenticationException {

	authenticate(authenticationRequest.getEmail(), authenticationRequest.getSenha());

	final String token = jwtTokenUtil.generateToken(authenticationRequest.getEmail());
	
	Usuario usuarioDoToken = usuarioRepository.findByUsername(authenticationRequest.getEmail()).get();

	return ResponseEntity.ok(new JwtTokenResponse(token));
	}

    @GetMapping("/refresh")
    public ResponseEntity<?> refreshAndGetAuthenticationToken(HttpServletRequest request) {
	String authToken = request.getHeader("Authorization");
	final String token = authToken.substring(7);

	if (jwtTokenUtil.canTokenBeRefreshed(token)) {
	    String refreshedToken = jwtTokenUtil.refreshToken(token);
	    String username = jwtTokenUtil.getUsernameFromToken(refreshedToken);
	    
	    Usuario usuarioDoToken = usuarioRepository.findByUsername(username).get();
	    return ResponseEntity.ok(new JwtTokenResponse(token));
	    } else {
	    return ResponseEntity.badRequest().body(null);
	}
    }

    @ExceptionHandler({ AuthenticationException.class })
    public ResponseEntity<String> handleAuthenticationException(AuthenticationException e) {
	return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
    }

    private void authenticate(String username, String password) {
	Objects.requireNonNull(username);
	Objects.requireNonNull(password);
	
	try {
	    
	    Usuario usuarioExistente = this.users.findByUsername(username).orElseThrow(() -> new UsuarioNaoEncontradoException());
	    
	    if (!this.passwordEncoder.matches(password, usuarioExistente.getPassword())) {
		throw new UsuarioSenhaInvalidaException();
	    }
	    
	} catch (UsuarioNaoEncontradoException e) {
	    throw new AuthenticationException("INVALID_USERNAME", e);
	} catch (UsuarioSenhaInvalidaException e) {
	    throw new AuthenticationException("INVALID_PASSWORD", e);
	}
    }
    
}
