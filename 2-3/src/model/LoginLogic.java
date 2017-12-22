package model;
import java.sql.*;
public class LoginLogic {
	public boolean execute(User user){

		if(user.getName().equals("kindai") && user.getPass().equals("1511140055")){
			return true;
		}
		return false;
	}

}
