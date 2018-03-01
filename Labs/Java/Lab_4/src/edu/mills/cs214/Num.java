package edu.mills.cs214;

/**
 * Comparable version of Number.
 * @author Genesis Hernandez
 *
 */
public abstract class Num extends Number implements Comparable<Num>{
	
	@Override
	public float floatValue() {
		return (float) doubleValue();
	}
	
	@Override
	public long longValue() {
		return (long) doubleValue();
	}
	
	@Override
	public int intValue() {
		return (int) doubleValue();
	}
	
	@Override
	public int compareTo(Num number) {
		double comparison = this.doubleValue() - number.doubleValue();
		if ( comparison < 0) {
			return -1;
		} else if (comparison > 0 ){
			return 1;
		}
		return 0;
	}
	
	@Override 
	public boolean equals(Object other) {
		if(other instanceof Num) {
			Num num = (Num)other;
			return this.doubleValue() == num.doubleValue();
		}
		return false;
	}
	

}
