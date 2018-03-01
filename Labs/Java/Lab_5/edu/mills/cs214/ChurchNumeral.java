package edu.mills.cs214;

import java.util.function.UnaryOperator;

/**
 * A representation of Church Numerals. This number cannot be negative.
 * @author Genesis Hernandez
 *
 */
public class ChurchNumeral {
	private int number; 
	
	/**
	 * Constructs a church numeral.
	 * @param number the number
	 * @throws IllegalArgumentException if number is negative
	 */
	public ChurchNumeral(int number) {
		if(number < 0) {
			throw new IllegalArgumentException("The number cannot be negative");
		}
		
		this.number = number; 
	}
	
	@Override
	public String toString() {
		return "Church Numeral: " + number;
	}
	
	/**
	 * Applies an operator to an argument n times, where n is the value of this ChurchNumeral.
	 * If n is zero, the operator is not applied and the argument is returned with no changes. 
	 * @param f the operator
	 * @param arg the argument
	 * @return the result of applying the operator on arg n times
	 */
	public Integer apply(UnaryOperator<Integer>f, Integer arg){
		if(number == 0) {
			return arg;
		}
		int count = number;
		int result = 0;
		while(count >= 0) {
			result = f.apply(arg);
			count--;
		}
		return result;
	}
	
	/**
	 * Adds one.
	 * @return a ChurchNumeral incremented by one.
	 */
	
	public ChurchNumeral plusOne() {
		return new ChurchNumeral(number + 1);
	}
	
	/**
	 * Adds two ChurchNumerals together.
	 * @param other the other ChurchNumeral
	 * @return the sum of two ChurchNumerals
	 */
	
	public ChurchNumeral plus(ChurchNumeral other) {
		return new ChurchNumeral(number + other.number);
	}
}
