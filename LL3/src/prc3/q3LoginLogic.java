package prc3;

import prc3.q3User;
import java.sql.*;

public class q3LoginLogic {
	public static boolean execute(q3User user) {

		Connection con = null;
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");

			String sql = "SELECT * FROM Q3_TBL WHERE ID=? AND PASS=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPass());
			ResultSet rest = stmt.executeQuery();
			while (rest.next()) {
				return true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

}
