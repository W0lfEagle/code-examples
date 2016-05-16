/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package parta;
import java.io.Serializable;
import java.util.ArrayList;


public class FootballClubNL implements Serializable {
	private String name;
	private int won;
	private int lost;
	private int drawn;
	private int goalsFor;
	private int goalsAgainst;

	private static final long serialVersionUID = 1L;
	/*
		This statement is used to provide a version identifier for the serializable class.
		It is used in Deserialization to check that the loaded class is compatible.
		If the loaded class has a different identifier an InvalidClassException will be thrown,
		this is why the deserializeFromDisk() method catches this exception.

	*/

	public FootballClubNL(String name, int won, int lost, int drawn, int goalsFor, int goalsAgainst) {
		this.name = name;
		this.won = won;
		this.lost = lost;
		this.drawn = drawn;
		this.goalsFor = goalsFor;
		this.goalsAgainst = goalsAgainst;
	}
	
	public String toString() {
		//A ONE
		//String noFormat = getName() + " W" + getWon() + " L" + getLost() + " D" + getDrawn() + " GF" + getGoalsFor() + " GA" + getGoalsAgainst();
		//return noFormat;
		
		//A TWO
		String format = String.format("%-30s %s%02d %s%02d %s%02d %s%02d %s%02d", getName(), "W", getWon(), "L", getLost(), "D",  getDrawn(), "GF", getGoalsFor(), "GA",  getGoalsAgainst());
		return format;
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
