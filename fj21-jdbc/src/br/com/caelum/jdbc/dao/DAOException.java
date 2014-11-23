package br.com.caelum.jdbc.dao;


public class DAOException extends RuntimeException {

	public DAOException(Exception e) {
		super("Erro de acesso a dados: " + e.getMessage(), e);
	}

	
}
