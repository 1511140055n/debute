package prc3;

import prc3.q3User;
import java.sql.*;

public class q3RegisterLogic {
	public void execute(q3User user) {
		Connection con = null;
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
			String sql = "INSERT INTO LOGIN (NAME, PASS) VALUES (?,?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPass());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return;
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
