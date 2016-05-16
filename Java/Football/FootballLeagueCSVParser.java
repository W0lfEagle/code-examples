/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package partb;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class FootballLeagueCSVParser {
	
	public static ArrayList<FootballClub> parseLeagueTable(String filename) {
		ArrayList<FootballClub> out = new ArrayList<FootballClub>();
		try {
			FileReader fileReader = new FileReader(filename);
			BufferedReader reader = new BufferedReader(fileReader);
			
			String in = reader.readLine(); // remove table headings
			ArrayList<String> clubs = new ArrayList<String>();
			int i = 0;
			while ((in = reader.readLine()) != null) { //add each club to seperate element in ArrayList
				clubs.add(in);
				i++;
			}
			String[] club = new String[6];
			for (int j = 0; j < clubs.size(); j++) {
				club = clubs.get(j).split(", "); //remove ", " and store each value seperately
				String name = club[0];
				int won = Integer.parseInt(club[1]);
				int drawn = Integer.parseInt(club[2]);
				int lost = Integer.parseInt(club[3]);
				int goalsFor = Integer.parseInt(club[4]);
				int goalsAgainst = Integer.parseInt(club[5]);
				FootballClub e = new FootballClub(name, won, drawn, lost, goalsFor, goalsAgainst);
				out.add(e);
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return out;
	}
}
