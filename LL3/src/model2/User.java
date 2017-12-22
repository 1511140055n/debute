package model2;

//ここの代わりにデータベースを使い、set・getを行う登録と呼び出し
//ここでデータベースを呼び出すメソッド？
public class User implements java.io.Serializable{
	private String id;
	private String pass;

	public User(){}
	public User(String id,String pass){
		this.id = id;
		this.pass = pass;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}


}
