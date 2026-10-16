<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
</head>

<body>

<h1>Details of Students:</h1>

<%
    ArrayList<Object[]> details =
        (ArrayList<Object[]>) request.getAttribute("details");

    if (details != null) {
        for (Object[] i : details) {
%>

 <%= i[0] %><br>
 <%= i[1] %><br>
 <%= i[2] %><br>


<%
        }
    }
%>

</body>
</html>