package hotword.tools;

import java.util.Random;

public class Dealrandom {
	
	public static int x;
	public static int y;
	public static Random random = new Random(System.currentTimeMillis());

	public static void doRandom() {
		x = random.nextInt(5000);
		y = random.nextInt(5000);
	}
	
	public static void main(String[] args) {
		
		for(int i=0;i<10;i++) {
			Dealrandom.doRandom();
			System.out.println(Dealrandom.x+"  "+Dealrandom.y);
		}
	}
	
}

