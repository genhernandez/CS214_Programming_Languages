package edu.mills.cs214.extra_credit;

/**
 * Represents a numerical value as a fraction.
 * @author Genesis Hernandez
 *
 */
public class Fraction extends MixedNumber {
	
	/**
	 * Creates a fraction. The denominator must be greater than 0. 
	 * @param numerator  the numerator
	 * @param denominator  the denominator
	 */
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
