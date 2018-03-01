package edu.mills.cs214;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;


/**
 * This class contains methods that explore functional programming in Java. 
 * @author Genesis Hernandez
 *
 */

public class Lab5 {

	/**
	 * Reverses a list.  
	 * @param srcList a list
	 * @return a reversed copy of list 
	 */
	public static <T> List<T> reverse(List<T> srcList){
		List<T> reversedList = new ArrayList<T>();
		if(srcList.size() == 0) {
			return srcList; 
		}
		for(int i = srcList.size()-1; i >= 0; i--) {
			reversedList.add(srcList.get(i));
		}
		return reversedList;
	}
	
	/**
	 * Finds the perfect numbers within a range. 
	 * @param limit the limit
	 */
	public static void functionalPerfectNumbers(int limit) {
		IntStream.range(1, limit).filter(n -> IntStream.range(1, n - 1).filter(x -> n % x == 0).sum() == n).forEach(a -> System.out.print(a + " "));
	}
	

	public static void imperativePerfectNumbers(int limit) {
		int sum = 0; 
		for(int i = 1; i <= limit; i++) {
			for(int j = 1; j <= i / 2; j++) {
				if(i % j == 0) {
					sum += j;
				}
			}
			if(sum == i) {
				System.out.print(i + " ");
			}
			sum = 0;
		}
	}
	
	/**
	 * Tests our methods.
	 * @param args is ignored.
	 */
	public static void main(String args[]) {
		List<Integer> emptyList = new ArrayList<Integer>();

		List<Integer> listWithNums = new ArrayList<Integer>();
		listWithNums.add(5);
		listWithNums.add(10);
		listWithNums.add(-1);
		listWithNums.add(12);
		listWithNums.add(7);
		listWithNums.add(9);

		List<String> listWithStrings = new ArrayList<String>();
		listWithStrings.add("a");
		listWithStrings.add("every");
		listWithStrings.add("hello");
		listWithStrings.add("boo");
		listWithStrings.add("money");
		listWithStrings.add("word");

		System.out.println("emptyList before reverse: " + emptyList);
		System.out.println("Reversing emptyList: " + reverse(emptyList));
		System.out.println("listWithNums before reverse: " + listWithNums);
		System.out.println("Reversing listWithNums: " + reverse(listWithNums));
		System.out.println("listWithStrings before reverse: " + listWithStrings);
		System.out.println("Reversing listWithStrings: " + reverse(listWithStrings));
		System.out.println();

		System.out.print("Perfect numbers from 1 to 1000 should be 6 28 496 and is: "); 
		long functionalStartTime = System.nanoTime();
		functionalPerfectNumbers(1000);
		long functionalEndTime = System.nanoTime();
		long functionalDuration = (functionalEndTime - functionalStartTime)/1000000;
		System.out.println();
		System.out.println("Duration: " + functionalDuration + " ms");
		System.out.println();
		System.out.print("Perfect numbers from 1 to 1000 should be 6 28 496 and is: "); 
		long imperativeStartTime = System.nanoTime();
		imperativePerfectNumbers(1000);
		long imperativeEndTime = System.nanoTime();
		long imperativeDuration = (imperativeEndTime - imperativeStartTime)/1000000;
		System.out.println();
		System.out.println("Duration: " + imperativeDuration+ " ms");
	}
}
