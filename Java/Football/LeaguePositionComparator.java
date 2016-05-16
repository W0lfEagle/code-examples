/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package partb;

import java.util.Comparator;

public class LeaguePositionComparator implements Comparator<FootballClub> {

	@Override
	public int compare(FootballClub one, FootballClub two) {
		
		//First by points
		int i = ((two.getWon()*3) + two.getDrawn()) - ((one.getWon()*3) + one.getDrawn());
		if (i != 0) return i;
		
		//Then by goal difference
		i = (two.getGoalsFor() - two.getGoalsAgainst()) - (one.getGoalsFor() - one.getGoalsAgainst());
		if (i != 0 ) return i;
		
		//Finally by goals scored
		return two.getGoalsFor() - one.getGoalsFor();
	}

}
