<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/tarefas.css" rel="stylesheet"/>
<link href="resources/css/jquery.css" rel="stylesheet">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mostra tarefa</title>
</head>
<body>
	<h3>Alterar tarefa - ${tarefa.id}</h3>
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}" ></input>
		Descrição: 
		<br/>
			<textarea name="descricao" rows="5" cols="100">${tarefa.descricao}</textarea>
		<br/>
		Finalizado?
		<input type="checkbox" name="finalizado"
		value="true" ${tarefa.finalizado ? 'checked' : ''}/>
		<br/>
		Data de finalização:
		<br/>
		
			<caelum:campoData id="dataFinalizacao"  valor="${tarefa.dataFinalizacao.time}" />
		
		<br/>
		<input type="submit" value="Alterar"></input>
	
	</form>
</body>
</html>