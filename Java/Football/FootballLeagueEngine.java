/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package partb;
import java.util.ArrayList;
import java.util.Collections;

public class FootballLeagueEngine {
	private ArrayList<FootballClub> league;

	private FootballLeagueEngine() { } //no no-argument constructor

	public FootballLeagueEngine(ArrayList<FootballClub> lge) {
		league = lge;

		//sort the list in place so that it's in league order, see API on the Comparator interface.
		Collections.sort(league, new LeaguePositionComparator());
	}

	public String parseCommand(String command) {
		//each command has an instruction and an argument. split the incoming string on the first whitespace character (or whitespace characterS if they are contiguous)
		
		String[] words = command.split("\\s+", 2);
		if (words.length < 2) {
			return "Syntax: <command> <argument>.";
		}

		//make both strings lower case and trim any excess whitespace to make comparisons easier
		String instruction = words[0].toLowerCase().trim();
		String argument = words[1].toLowerCase().trim();
		
		//Check if team name is correct. not for league or show
		if (!instruction.equals("league") && !instruction.equals("show") && !checkArgument(argument)) {
			return "I don't understand '" + instruction + " " + argument + "'.\n"
					+ "Use the 'SHOW HELP' command to display a list of possible instructions.\n"
					+ "Use the 'SHOW TEAMS' command to display the teams in the league";
		}

		switch(instruction) {
			case "points": return points(argument);
			case "goalsf": return goalsF(argument);
			case "goalsa": return goalsA(argument);
			case "goaldif": return goalDif(argument);
			case "position": return position(argument);
			case "league": return league(argument);
			case "games": return games(argument);
			case "wins": return wins(argument);
			case "draws": return draws(argument);
			case "losses": return losses(argument);
			case "breakdown": return breakdown(argument);
			case "show": if (argument.equals("help")) {
				return "\n" + getAvailableCommands();
			}
			else if (argument.equals("teams")) 
				return showTeams();
			else return "I don't understand '" + instruction + " " + argument + "'.";
			default: return "I don't understand '" + instruction + "'.";
		}
	}
	
	//check that the club name entered is valid
	private boolean checkArgument(String argument) {
		
		for (int i = 0; i < league.size(); i++) {
			FootballClub toCheck = league.get(i);
			String clubName = toCheck.getName();
			String clubLowerC = clubName.toLowerCase();
			if (argument.equals(clubLowerC)) {
				return true;
			}
		}
		return false;
	}

	public int clubIndex(String club) {
		
		for (int i = 0; i < league.size(); i++) {
			FootballClub toCheck = league.get(i);
			String clubName = toCheck.getName();
			String clubLowerC = clubName.toLowerCase();
			if (club.equals(clubLowerC)) {
				return i;
			}
		}
		return -1;
	}
	
	public String points(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = (a.getWon()*3) + a.getDrawn();
		return a.getName() + " has " + result + " points.";
	}
	
	public String goalsF(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getGoalsFor();
		return a.getName() + " has scored " + result + " goals.";
	}
	
	public String goalsA(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getGoalsAgainst();
		return a.getName() + " has conceded " + result + " goals.";
	}
	
	public String goalDif(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getGoalsFor() - a.getGoalsAgainst();
		return a.getName() + " has a goal difference of " +  result + ".";
	}
	
	public String position(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = clubIndex(club);
		return a.getName() + " is in position " +  (result+1) + "."; //Plus 1 since there is no position 0
	}
	
	// Method will check that the user is entering only a number between 1 and 20 using try catch block
	public String league(String club) {
		try {
			int pos = Integer.parseInt(club);
			if (pos <1 || pos >20) {
				return "Choose a position between 1 and 20.";
			}
			FootballClub a = league.get(pos-1);
			return a.getName() + " is in position " + pos + ".";
		} catch (NumberFormatException e){
			return "Please enter a number between 1 and 20 as in this example. LEAGUE <number>";
		}
	}
	
	public String games(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getWon() + a.getLost() + a.getDrawn();
		return a.getName() + " has played " + result + " games.";
	}
	
	public String wins(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getWon();
		return a.getName() + " has won " + result + " games.";
	}
	
	public String draws(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getDrawn();
		return a.getName() + " has drawn " + result + " games.";
	}
	
	public String losses(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int result = a.getLost();
		return a.getName() + " has lost " + result + " games.";
	}
	
	//TODO: Include decimal? (arsenal W-63% L-18% D-18% = 99%)
	public String breakdown(String club) {
		
		FootballClub a = league.get(clubIndex(club));
		int games = a.getWon() + a.getLost() + a.getDrawn();
		float winPer = (a.getWon() / (float) games) * 100;
		float lossPer = (a.getLost() / (float) games) * 100;
		float drawPer = (a.getDrawn() / (float) games) * 100;		
		return a.getName() + " has played " + games + " games.\n" + 
				"With a win percentage of " + (int) winPer + "%\n" +
				"A loss percentage of " + (int) lossPer + "%\n" + 
				"And a draw percentage of " + (int) drawPer + "%.";
	}
	
	public String showTeams() {
		String teams = "\n";
		for (int i=0; i<league.size(); i++) {
			FootballClub a = league.get(i);
			teams = teams + a.getName() + "\n";
		}
		return teams;
	}


	public String getAvailableCommands() {
		StringBuilder sb = new StringBuilder();
		sb.append("POINTS <team>	show the points total for <team>\n");
		sb.append("GOALSF <team>	show the number of goals scored by <team>\n");
		sb.append("GOALSA <team>	show the number of goals conceded by <team>\n");
		sb.append("GOALDIF <team>	show goal difference for <team>\n");
		sb.append("POSITION <team>	show the position in the league of <team>\n");
		sb.append("LEAGUE <number>	show which team is in position number <number> in the league\n");
		sb.append("GAMES <team>		show the number of games <team> has played\n");
		sb.append("WINS <team>		show the number of wins for <team>\n");
		sb.append("DRAWS <team>	show the number of draws for <team>\n");
		sb.append("LOSSES <team>	show the number of losses for <team>\n");
		sb.append("BREAKDOWN <team>	show percentage of games won/lost/drawn for <team>\n");
		sb.append("SHOW TEAMS		show the names of all the teams in the league\n");
		sb.append("SHOW HELP		show this help");
		return sb.toString();
	}
}
