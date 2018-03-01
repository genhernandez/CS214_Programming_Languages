package edu.mills.cs214;

import static org.junit.Assert.fail;

import org.junit.jupiter.api.Test;

import org.junit.*;
import java.util.function.UnaryOperator;

/**
 * Test class for ChurchNumeral
 * @author Genesis Hernandez
 *
 */
public class ChurchNumeralTest {
	
	@Test
	public void testChurchNumeral() {
		try {
			new ChurchNumeral(0);
			new ChurchNumeral(1);
			new ChurchNumeral(10);
			new ChurchNumeral(-1);
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test 
	public void testChurchNumeralIllegalValue() {
		try {
			new ChurchNumeral(-1);
			fail("Number cannot be negative");
		} catch (IllegalArgumentException e) {
			
		}
	}
	
	@Test
	public void testToString() {		
		for(int i = 0; i <= 5; i++) {
			ChurchNumeral current = new ChurchNumeral(i);
			String expected = "Church Numeral: " + i;
			Assert.assertEquals(expected, current.toString());
		}
	}
	
	@Test
	public void testApply() {
		UnaryOperator<Integer> operator = t -> t+1;
		Integer result;
		for(int i = 0; i <=5; i++) {
			ChurchNumeral current = new ChurchNumeral(i);
			if(i == 0) {
				result = 0;
				Assert.assertTrue(result.equals(current.apply(operator, i)));
			} else {
			result = i + 1;
			Assert.assertTrue(result.equals(current.apply(operator, i)));
			}
		}
	}
	
	@Test
	public void testPlusOne() {
		for(int i = 0; i <= 5; i++) {
			ChurchNumeral current = new ChurchNumeral(i);
			current = current.plusOne();
			ChurchNumeral expected = new ChurchNumeral(i + 1);
			Assert.assertEquals(expected.toString(), current.toString());
		}
	}
	
	@Test
	public void testPlus() {
		for(int i = 0; i <= 5; i++) {
			ChurchNumeral first = new ChurchNumeral(i);
			ChurchNumeral second = new ChurchNumeral(i + 1);
			ChurchNumeral expected = new ChurchNumeral(i + (i + 1));
			Assert.assertEquals(expected.toString(), first.plus(second).toString());
		}
	}
}
