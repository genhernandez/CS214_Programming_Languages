package edu.mills.cs214.extra_credit;

public class Fraction extends MixedNumber {
	private int numerator;
	private int denominator;
	
	public Fraction(int numerator, int denominator) {
		super(0, numerator, denominator);
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
