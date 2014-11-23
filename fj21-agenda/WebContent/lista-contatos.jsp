<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista contatos JSTL</title>
<style type="text/css">
table,th,td {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="cabecalho.jsp"></c:import>

	<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao"></jsp:useBean>

	<table>
		<tr>
			<th>Nome</th>
			<th>E-mail</th>
			<th>Endereço</th>
			<th>Data de nascimento</th>
		</tr>

		<c:forEach var="contato" items="${dao.lista}">

			<tr>
				<td>${contato.nome}</td>
				<td>
				
<%-- 					<c:if test="${not empty contato.email}"> --%>
<%-- 						<a href="mailto:${Contato.email}">${contato.email}</a> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${empty contato.email}"> --%>
<!-- 						E-mail não informado -->
<%-- 					</c:if> --%>

						<c:choose>
							<c:when test="${not empty contato.email}">
								<a href="mailto:${Contato.email}">${contato.email}</a>
							</c:when>
							<c:otherwise>
								E-mail não informado
							</c:otherwise>
						</c:choose>
				</td>
				<td>${contato.endereco}</td>
				<td><fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy"/></td>
			</tr>

		</c:forEach>

	</table>

<c:import url="rodape.jsp"></c:import>
</body>
</html>