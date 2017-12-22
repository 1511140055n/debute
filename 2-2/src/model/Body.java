package model;

import java.io.Serializable;

public class Body implements Serializable{
	private double t;
	private double w;
	private double bmi;

	public Body(){};
	public Body(int a, int b){
		this.t = (double)a/100;
		this.w = (double)b;
	}
	public double getT() {
		return t;
	}
	public void setT(int t) {
		this.t = t;
	}
	public double getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
}
