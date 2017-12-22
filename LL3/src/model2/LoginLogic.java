package model2;

//ここで登録または呼び出しをする際に入力したid,passをUserから引き出すデータベースと照合する？
public class LoginLogic {
	public static  boolean execute(User user){
		if(user.getId().equals("123") && user.getPass().equals("456")){
			return true;
		}
		return false;
	}
}

