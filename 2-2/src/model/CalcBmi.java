package model;

public class CalcBmi {
	public void calc(Body b){
		double d = b.getT()*b.getT();
		b.setBmi((double)b.getW()/d);
		System.out.println(b.getT());
	}
}
