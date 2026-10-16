package pac10;

import java.sql.*;

public class StudentDao {

    public Student getStudent(int id) {

        Student s = new Student();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school",
                "root",
                "barurichandrasekhar@885"
            );

            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM student1 WHERE id=?");

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setMarks(rs.getInt("marks"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
}