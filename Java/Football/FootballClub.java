/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package partb;
import java.io.Serializable;

public class FootballClub implements Serializable {
	private String name;
	private int won;
	private int lost;
	private int drawn;
	private int goalsFor;
	private int goalsAgainst;

	private static final long serialVersionUID = 2L;

	public FootballClub(String name, int won, int lost, int drawn, int goalsFor, int goalsAgainst) {
		this.name = name;
		this.won = won;
		this.lost = lost;
		this.drawn = drawn;
		this.goalsFor = goalsFor;
		this.goalsAgainst = goalsAgainst;
	}

	public String getName() {
		return name;
	}

	public int getWon() {
		return won;
	}

	public int getLost() {
		return lost;
	}

	public int getDrawn() {
		return drawn;
	}

	public int getGoalsFor() {
		return goalsFor;
	}

	public int getGoalsAgainst() {
		return goalsAgainst;
	}
}
