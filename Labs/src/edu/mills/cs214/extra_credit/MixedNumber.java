package edu.mills.cs214.extra_credit;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MixedNumber extends Num {
	private int wholeNumber;
	protected int numerator;
	protected int denominator;
	
	public MixedNumber(int wholeNumber, int numerator, int denominator) {
		if(denominator == 0) {
			throw new IllegalArgumentException("Denominator cannot be 0");
		}
		this.wholeNumber = wholeNumber;
		this.numerator = numerator;
		this.denominator = denominator;
	}
	
	@Override
	public double doubleValue() {
		return wholeNumber + ((double) numerator / (double) denominator);
	}
	
	@Override
	public String toString() {
		if(wholeNumber == 0) {
			return numerator + "/"  + denominator;
		}
		return wholeNumber + " " + numerator + "/"  + denominator; 
	}
	
	public static void main(String[] args) {
		MixedNumber mixNum1 = new MixedNumber(1, 2, 3);
		MixedNumber mixNum2 = new MixedNumber(1, 4, 6);
		MixedNumber mixNum3 = new MixedNumber(0, 5, 15);
		MixedNumber mixNum4 = new MixedNumber(0, 6, 18);
		
		Fraction f1 = new Fraction(5, 10);
		Fraction f2 = new Fraction(10, 6);
		Fraction f3 = new Fraction(1, 3);
		Fraction f4 = new Fraction(3, 9);
		
		
		System.out.println("Testing toString() on MixedNumber");
		System.out.println("mixNum1.toString() should be 1 2/3 and is: " + mixNum1.toString());
		System.out.println("mixNum2.toString() should be 1 4/6 and is: " + mixNum2.toString());
		System.out.println("mixNum3.toString() should be 5/15 and is: " + mixNum3.toString());
		System.out.println("mixNum4.toString() should be 6/18 and is: " + mixNum4.toString());
		System.out.println();
		
		System.out.println("Testing toString() on Fraction");
		System.out.println("f1.toString() should be 5/10 and is: " + f1.toString());
		System.out.println("f2.toString() should be 10/6 and is: " + f2.toString());
		System.out.println("f3.toString() should be 1/3 and is: " + f3.toString());
		System.out.println("f4.toString() should be 3/9 and is: " + f4.toString());
		System.out.println();
		
		System.out.println("Testing doubleValue() on MixedNumber");
		System.out.println("mixNum1.doubleValue() should be 1.67 and is: " + mixNum1.doubleValue());
		System.out.println("mixNum2.doubleValue() should be 1.67 and is: " + mixNum2.doubleValue());
		System.out.println("mixNum3.doubleValue() should be 0.33 and is: " + mixNum3.doubleValue());
		System.out.println("mixNum4.doubleValue() should be 0.33 and is: " + mixNum4.doubleValue());
		System.out.println();

		System.out.println("Testing doubleValue() on Fraction");
		System.out.println("f1.doubleValue() should be 0.50 and is: " + f1.doubleValue());
		System.out.println("f2.doubleValue() should be 1.67 and is: " + f2.doubleValue());
		System.out.println("f3.doubleValue() should be 0.33 and is: " + f3.doubleValue());
		System.out.println("f4.doubleValue() should be 0.33 and is: " + f4.doubleValue());
		System.out.println();

		System.out.println("Testing compareTo()");
		System.out.println("Testing mixNum1.compareTo(mixNum2) should be 0 and is: " + mixNum1.compareTo(mixNum2));
		System.out.println("Testing mixNum2.compareTo(mixNum3) should be 1 and is: " + mixNum2.compareTo(mixNum3));
		System.out.println("Testing mixNum4.compareTo(mixNum1) should be -1 and is: " + mixNum4.compareTo(mixNum1));
		System.out.println("Testing mixNum2.compareTo(f2) should be -1 and is: " + mixNum2.compareTo(f2)); 
		System.out.println("Testing f2.compareTo(mixNum2) should be 1 and is: " + f2.compareTo(mixNum2)); 
		System.out.println("Testing f1.compareTo(f2) should be -1  and is: " + f1.compareTo(f2));
		System.out.println("Testing f3.compareTo(f4) should be 0 and is: " + f3.compareTo(f4));
		System.out.println("Testing f1.compareTo(f3) should be 1 and is: " + f1.compareTo(f3));
		System.out.println();
		
		System.out.println("Testing equals()");
		System.out.println("Testing mixNum1.equals(mixNum2) should be true and is: " + mixNum1.equals(mixNum2));
		System.out.println("Testing mixNum2.equals(mixNum3) should be false and is: " + mixNum2.equals(mixNum3));
		System.out.println("Testing f2.equals(mixNum2) should be false and is: " + f2.equals(mixNum2));
		System.out.println("Testing mixNum1.equals(f1) should be false and is: " + mixNum1.equals(f1));
		System.out.println();
		
		List<Num> list = new ArrayList<Num>(); 
		list.add(mixNum2);
		list.add(f3);
		list.add(mixNum1);
		list.add(f4);
		list.add(f2);
		list.add(mixNum4);
		list.add(mixNum3);
		list.add(f1);
		System.out.println("unsorted list: " + list);
		Collections.sort(list);
		System.out.println("sorted list: " + list);
		


	}

}
