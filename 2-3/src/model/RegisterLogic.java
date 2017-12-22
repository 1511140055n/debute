package model;
import java.sql.*;
public class RegisterLogic {
	public boolean execute(User user){
		/*Connection con = null;
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
			String sql = "SELECT * FROM ID_TBL WHERE NAME = ? AND PASS = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,user.getName());
			stmt.setString(2,user.getPass());
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
		}*/
		if(user.getName().equals("kindai") && user.getPass().equals("1511140055")){
			return true;
		}
		return false;
	}

}
