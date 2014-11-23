<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/tarefas.css" rel="stylesheet"/>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
table,th,td {
	border: 1px solid black;
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista tarefas</title>
</head>
<body>

	<script type="text/javascript">
		function finalizaAgora(id){
			$.post("finalizaTarefa", {'id' : id}, function(){
				//seleciona o elemento html através
				// da ID e altera o html dele
				$("#tarefa_"+id).html("Finalizado");
			});
		}
	</script>

	<a href="novaTarefa">Criar nova tarefa</a>
	
	<br/><br/>
	
	<table>
	<tr>
		<th>Id</th>
		<th>Descrição</th>
		<th>Finalizado?</th>
		<th>Data da finalização</th>
	</tr>
	<c:forEach var="tarefa" items="${tarefas}" >
	<tr>
		<td>${tarefa.id}</td>
		<td>${tarefa.descricao}</td>
		<c:if test="${tarefa.finalizado eq false }">
			<td id="tarefa_${tarefa.id}">
				<a href="#" onClick="finalizaAgora(${tarefa.id})">Finalizar agora!</a>
			</td>
		</c:if>
		<c:if test="${tarefa.finalizado eq true }">
			<td>Finalizado</td>
		</c:if>
		<td>
			<fmt:formatDate value="${tarefa.dataFinalizacao.time }" pattern="dd/MM/yyyy"/>
		</td>
		<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
		<td><a href="mostraTarefa?id=${tarefa.id}">Editar</a></td>
	</tr>		
	</c:forEach>
	</table>
</body>
</html>