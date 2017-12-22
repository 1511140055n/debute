package prc3;

public class q3User implements java.io.Serializable {

	private String name;
	private String pass;

	public q3User() {};
	public q3User(String name, String pass) {
		this.name = name;
		this.pass = pass;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

}
