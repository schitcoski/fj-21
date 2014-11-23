<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/jquery.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adiciona contatos</title>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<c:import url="cabecalho.jsp"></c:import>

	<h2>Adiciona contato</h2>
	<form action="adicionaContato" method="POST">
		Nome: <input type="text" name="nome" /><br/>
		E-mail: <input type="text" name="email" /><br/>
		Endereço: <input type="text" name="endereco" /><br/>
		Data de nascimento: <caelum:campoData id="dataNascimento" /><br/>
		<input type="submit" value="Gravar" />	
	</form>
	
<c:import url="rodape.jsp"></c:import>
</body>
</html>