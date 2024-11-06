<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="styles.jsp"%>
    <%@ page import="java.io.*" %>
    <jsp:useBean id="team" scope="session" class="com.example.webdomaci5.Team"/>
    <jsp:useBean id="date" class="java.util.Date"/>
</head>
<body>
    <%@ include file="navBar.jsp" %>
    <%
        String fileName = "tim_" + team.getName() + "_" + date.toString().replace(":", ".").replace(" ", "_") + ".txt";
        String strPath = "C:\\Users\\Shus\\Desktop\\WebDomaci5\\src\\main\\resources\\" + fileName;
        File strFile = new File(strPath);
        boolean fileCreated = strFile.createNewFile();

        if(fileCreated){
            Writer fWriter = new BufferedWriter(new FileWriter(strFile));

            fWriter.write(team.toString() + "\n");
            for (int i = 1; i <= team.getTeamSize(); i++){
                fWriter.write("\nUcesnik " + i + ":");
                fWriter.write("Ime: " + request.getParameter("firstName" + i) + "\n");
                fWriter.write("Prezime: " + request.getParameter("lastName" + i) + "\n");
                fWriter.write("Email adresa: " + request.getParameter("email" + i) + "\n");
                fWriter.write("Broj ucesca na hakatonima: " + request.getParameter("participations" + i) + "\n");
                fWriter.write("Uloga: " + request.getParameter("role" + i) + "\n");
                fWriter.write("LinkedIn profil: " + request.getParameter("linkedin" + i) + "\n");
                fWriter.write("\n");
            }
            fWriter.flush();
            fWriter.close();
        }
    %>
    <%@include file="thanks.jsp" %>
</body>
</html>
