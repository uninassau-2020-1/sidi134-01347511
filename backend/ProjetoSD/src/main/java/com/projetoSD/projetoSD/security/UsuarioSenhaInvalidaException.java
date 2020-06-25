package com.projetoSD.projetoSD.security;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.BAD_REQUEST)
public class UsuarioSenhaInvalidaException extends RuntimeException {

    private static final long serialVersionUID = 630699971770065488L;

    private static String MENSAGEM_SENHA_INVALIDA = "A senha informada não corresponde com a senha cadastrada para o usuário.";

    public UsuarioSenhaInvalidaException() {
	super(MENSAGEM_SENHA_INVALIDA);
    }
}

