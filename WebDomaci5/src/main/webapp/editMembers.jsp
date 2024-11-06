<%--
  Created by IntelliJ IDEA.
  User: Shus
  Date: 4/27/2022
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clanovi</title>
    <%@include file="styles.jsp"%>

    <jsp:useBean id="team" scope="session" class="com.example.webdomaci5.Team" />

    <jsp:setProperty name="team" property="name" param="teamName" />
    <jsp:setProperty name="team" property="email" param="teamEmail" />
    <jsp:setProperty name="team" property="phoneNumber" param="phoneNumber" />
    <jsp:setProperty name="team" property="teamMoto" param="teamMoto" />
    <jsp:setProperty name="team" property="referral" param="referral" />
    <jsp:setProperty name="team" property="teamSize" param="teamSize" />
</head>
<body>
<%@ include file="navBar.jsp" %>
<div class="container text-center">
    <h1>Clanovi ekipe <jsp:getProperty name="team" property="name"/></h1>
</div>
<div class="container">
    <form action="writer.jsp" method="POST">
        <% for(int i = 0; i < Integer.parseInt(request.getParameter("teamSize")); i+=1) { %>
        <br>
        <h2>Ucesnik <%=i+1%></h2>
        <br>
        <label class="form-label">Ime</label>
        <input type="text" class="form-control" name="firstName<%=i+1%>" id="firstName<%=i+1%>">
        <br>
        <label class="form-label">Prezime</label>
        <input type="text" class="form-control" name="lastName<%=i+1%>" id="lastName<%=i+1%>">
        <br>
        <label class="form-label">Email adresa</label>
        <input type="email" class="form-control" name="email<%=i+1%>" id="email<%=i+1%>">
        <br>
        <label class="form-label">Broj učešća na hakatonima</label>
        <input type="number" class="form-control" name="participations<%=i+1%>" id="participations<%=i+1%>">
        <br>
        <label class="form-label">Uloga</label>
        <input type="text" class="form-control" name="role<%=i+1%>" id="role<%=i+1%>">
        <br>
        <label class="form-label">LinkedIn</label>
        <input type="text" class="form-control" name="linkedin<%=i+1%>" id="linkedin<%=i+1%>">
        <% } %>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
