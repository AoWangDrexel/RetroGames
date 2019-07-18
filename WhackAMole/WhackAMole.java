
public class WhackAMole {
	private int score;
	private int molesLeft;
	private char[][] moleGrid;
	private int numAttempts;
	private int gridDimensions;

	public WhackAMole(int numAttempts, int gridDimensions) {
		this.numAttempts = numAttempts;
		this.gridDimensions = gridDimensions;
		moleGrid = new char[gridDimensions][gridDimensions];

		for (int i = 0; i < gridDimensions; i++) {
			for (int j = 0; j < gridDimensions; j++) {
				moleGrid[i][j] = '-';
			}
		}
	}

	public boolean place(int x, int y) {
		if (moleGrid[x][y] == '-') {
			moleGrid[x][y] = 'M';
			molesLeft++;
			return true;
		}
		return false;
	}

	public void whack(int x, int y) {
		if (moleGrid[x][y] == 'M') {
			moleGrid[x][y] = 'W';
			System.out.println("Whacked!");
			score++;
			molesLeft--;
		} else {
			moleGrid[x][y] = 'T';
			System.out.println("Tried and Missed!");
		}
		numAttempts--;
	}

	public boolean isWhacked(int x, int y) {
		if (moleGrid[x][y] == 'W' || moleGrid[x][y] == 'T') {
			return true;
		}
		return false;
	}

	public void setAttempts(int numAttempts) {
		this.numAttempts = numAttempts;
	}

	public int getAttempts() {
		return numAttempts;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getScore() {
		return score;
	}

	public void setMolesLeft(int molesLeft) {
		this.molesLeft = molesLeft;
	}

	public int getMolesLeft() {
		return molesLeft;
	}

	public void printGridToUser() {
		char[][] hiddenMoleGrid = new char[gridDimensions][gridDimensions];
		for (int i = 0; i < gridDimensions; i++) {
			for (int j = 0; j < gridDimensions; j++) {
				if (moleGrid[i][j] == 'M') {
					hiddenMoleGrid[i][j] = '-';
				} else {
					hiddenMoleGrid[i][j] = moleGrid[i][j];
				}
			}
		}
		for (int i = 0; i < gridDimensions; i++) {
			for (int j = 0; j < gridDimensions; j++) {
				System.out.print(hiddenMoleGrid[i][j] + " ");
			}
			System.out.println();
		}
	}

	public void printGrid() {
		for (int i = 0; i < gridDimensions; i++) {
			for (int j = 0; j < gridDimensions; j++) {
				System.out.print(moleGrid[i][j] + " ");
			}
			System.out.println();
		}
	}
}
