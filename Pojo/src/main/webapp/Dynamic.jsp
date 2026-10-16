<%@ page import="java.sql.*" %>

<html>
<body>

<form method="post" action="Dynamic.jsp">
    Student Id:
    <input type="text" name="id"><br><br>
    <input type="submit" value="Submit">
</form>

<%
String id = request.getParameter("id");

if(id != null)
{
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/school",
            "root",
            "barurichandrasekhar@885"
        );

        PreparedStatement ps = con.prepareStatement(
            "select * from student1 where id=?"
        );

        ps.setInt(1, Integer.parseInt(id));

        ResultSet rs = ps.executeQuery();

        if(rs.next())
        {
%>

<h3>Student Details</h3>

Name :<%=rs.getString("name")%><br>
ID   : <%=rs.getInt("id")%><br>
Marks: <%=rs.getInt("marks")%>

<%
        }
        else
        {
            out.println("Student not found");
        }

        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

</body>
</html>