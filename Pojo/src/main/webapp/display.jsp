<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pac10.Student" %>
<%@ page import="pac10.StudentDao" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
</head>

<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    StudentDao dao = new StudentDao();
    Student s = dao.getStudent(id);
%>

<h2>Student Details</h2>

ID: <%= s.getId() %><br>
Name: <%= s.getName() %><br>
Marks: <%= s.getMarks() %><br>

</body>
</html>