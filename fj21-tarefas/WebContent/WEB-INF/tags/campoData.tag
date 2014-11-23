<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="valor" type="java.util.Date" %>

<fmt:formatDate value="${valor}" pattern="dd/MM/yyyy" var="dataFormatada"/>

<input id="${id}" name="${id}" value="${dataFormatada}" >
<script>
	$("#${id}").datepicker({dateFormat: 'dd/mm/yy'});
</script>