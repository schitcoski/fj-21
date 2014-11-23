<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<hr/>
<% 
	DateFormat df =new SimpleDateFormat("yyyy");
	String ano = df.format(new Date());
%>
<p>Copyright <%= ano %><p>