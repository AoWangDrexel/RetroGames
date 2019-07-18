import java.util.Scanner;
import java.util.regex.*;

public class RunnerWhackAMole {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String x;
		String y;
		int xInt = 0;
		int yInt = 0;
		String gridSize;
		String attempts;

		// asking for grid size to make a grid square and number of attempts
		// if input is not an integer, scanner will loop until it gets one
		do {
			System.out.println("Grid size?: ");
			gridSize = scan.nextLine();
			System.out.println("How many attempts?: ");
			attempts = scan.nextLine();
			
			// checks if input is an integer
			if (!regexChecker("^[0-9]*$", gridSize) || !regexChecker("^[0-9]*$", attempts)) {
				System.out.println("Wrong input type! Try again");
			} else {
				
				// if is an empty string ""
				System.out.println("Enter input!");
			}

		} while (!regexChecker("^[0-9]*$", gridSize) || !regexChecker("^[0-9]*$", attempts) || gridSize.isEmpty()
				|| attempts.isEmpty());

		// turning string into integer
		int attemptsInt = Integer.parseInt(attempts);
		int gridSizeInt = Integer.parseInt(gridSize);

		// creating a mole object
		WhackAMole mole = new WhackAMole(attemptsInt, gridSizeInt);

		// setting the number of attempts in the WhackAMole class
		mole.setAttempts(attemptsInt);

		// placing the moles in random coordinates based on the grid size
		// the number of moles is 1/5 of the area of the grid
		for (int i = 0; i < (int) (Math.pow(gridSizeInt, 2) / 5); i++) {
			int randX = (int) (Math.random() * gridSizeInt);
			int randY = (int) (Math.random() * gridSizeInt);
			mole.place(randX, randY);
		}
		System.out.println("Num of moles: " + mole.getMolesLeft());
		System.out.println("Player, you only get: " + mole.getAttempts() + " attempts");

		// asks user for whacking coordinates until user runs out of attempts or when
		// there are no moles left
		while (attemptsInt != 0 && mole.getMolesLeft() != 0) {

			// continually asks for x and y until gets an integer that is inside of the grid
			do {
				System.out.println("Enter X: (To exit, press -1)");
				x = scan.nextLine();
				System.out.println("Enter Y: (To exit, press -1)");
				y = scan.nextLine();
				
				if (x.equals("-1") && y.equals("-1")) {
					break;
				}
				
				if (!regexChecker("^[0-9]*$", x) || !regexChecker("^[0-9]*$", y)) {
					System.out.println("Wrong input type! Try again");
				} else if (x.isEmpty() || y.isEmpty()) {
					System.out.println("Enter coordinates!");
				} else {
					xInt = Integer.parseInt(x);
					yInt = Integer.parseInt(y);
					if (xInt >= gridSizeInt || yInt >= gridSizeInt) {
						System.out.println("Stay inside the grid!");
					} else if (mole.isWhacked(xInt, yInt)) {
						System.out.println("Already been whacked at");
					}
				}
			} while ((!regexChecker("^[0-9]*$", x) || !regexChecker("^[0-9]*$", y))
					|| (xInt >= gridSizeInt || yInt >= gridSizeInt) || mole.isWhacked(xInt, yInt) || x.isEmpty()
					|| y.isEmpty());

			if (x.equals("-1") && y.equals("-1")) {
				break;
			}
			
			mole.whack(xInt, yInt);
			attemptsInt--;
			System.out.println("Attempts: " + mole.getAttempts());
			mole.printGridToUser();
		}

		if (mole.getMolesLeft() == 0) {
			System.out.println("You win! Congratulations! You whacked them all!");
		} else {
			System.out.println("Better luck next time!");
		}
		mole.printGrid();
	}

	public static boolean regexChecker(String theRegex, String strCheck) {
		Pattern checkRegex = Pattern.compile(theRegex);
		Matcher regexMatcher = checkRegex.matcher(strCheck);
		return regexMatcher.matches();
	}
}
