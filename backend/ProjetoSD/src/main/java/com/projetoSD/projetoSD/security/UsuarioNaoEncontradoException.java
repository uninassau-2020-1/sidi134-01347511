package com.projetoSD.projetoSD.security;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

@ResponseStatus(code = HttpStatus.BAD_REQUEST)
public class UsuarioNaoEncontradoException extends RuntimeException {

    private static final long serialVersionUID = 630699971770065488L;

    private static String MENSAGEM_USUARIO_INVALIDO = "Não foi possível encontrar este usuário.";

    public UsuarioNaoEncontradoException() {
	super(MENSAGEM_USUARIO_INVALIDO);
    }
}

