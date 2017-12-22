package model;

public class CalcArea {
	public void execute(Circle c){
		c.setAreas(c.getR()*c.getR()*Math.PI);
	}
}
