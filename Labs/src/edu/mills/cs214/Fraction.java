package edu.mills.cs214;

public class Fraction extends Num {

	private int numerator;
	private int denominator;
	
	public Fraction(int numerator, int denominator) {
		
		this.numerator = numerator;
		this.denominator = denominator;
	}
	
	@Override
	public double doubleValue() {
		return  (double) numerator / (double) denominator;
	}
	
	@Override
	public String toString() {
		return  numerator + "/" + denominator;
	}
	
	

}
