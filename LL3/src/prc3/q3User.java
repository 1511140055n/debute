package prc3;

public class q3User implements java.io.Serializable {

	private String id;
	private String pass;

	public q3User() {};
	public q3User(String id, String pass) {
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
