<%--
  Created by IntelliJ IDEA.
  User: Shus
  Date: 4/27/2022
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prijava</title>
    <%@include file="styles.jsp"%>
    <jsp:useBean id="team" scope="session" class="com.example.webdomaci5.Team"/>
</head>
<body>
<%@ include file="navBar.jsp" %>

<% if (team.getName() == null) { %>
<%@ include file="apply_body.jsp" %>
<% } else { %>
<%@ include file="thanks.jsp" %>
<% } %>
</body>
</html>
