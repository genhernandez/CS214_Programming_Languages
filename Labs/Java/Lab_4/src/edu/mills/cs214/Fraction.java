package edu.mills.cs214;

/**
 * Represents a numerical value as a fraction.
 * @author Genesis Hernandez
 *
 */
public class Fraction extends Num {

	private int numerator;
	private int denominator;
	
	/**
	 * Creates a fraction.
	 * @param numerator  the numerator
	 * @param denominator  the denominator
	 */
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
