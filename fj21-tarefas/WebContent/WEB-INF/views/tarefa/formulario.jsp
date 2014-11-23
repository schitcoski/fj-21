<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/tarefas.css" rel="stylesheet"/>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adicionar tarefas</title>
</head>
<body>
	<h3>Adicionar Tarefas</h3>
	<form:errors path="tarefa.descricao" cssStyle="color:red"></form:errors>
	<form action="adicionaTarefa" method="post">
	Descrição: <br/>
	<textarea name="descricao" rows="5" cols="30"></textarea><br/>
	<input type="submit" value="Adicionar">	
	</form>
</body>
</html>