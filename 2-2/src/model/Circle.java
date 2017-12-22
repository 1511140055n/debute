package model;

public class Circle implements java.io.Serializable{
	private int r;
	private double areas;

	public Circle(){};
	public Circle(int t){
		this.r = t;
	}

	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public double getAreas() {
		return areas;
	}
	public void setAreas(double areas) {
		this.areas = areas;
	}

}
