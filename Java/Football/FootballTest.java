/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package parta;
import java.util.ArrayList;
import java.io.*;

public class FootballTest
{
	public static void main (String[] args) throws Exception
	{
			//make some FootballClubNL objects
			FootballClubNL fc1 = new FootballClubNL("Arsenal",10,2,3,45,5);
			FootballClubNL fc2 = new FootballClubNL("Chelsea",8,2,5,17,3);
			FootballClubNL fc3 = new FootballClubNL("Aston Villa",5,5,5,5,9);
			FootballClubNL fc4 = new FootballClubNL("Hull City",6,4,5,30,15);
			FootballClubNL fc5 = new FootballClubNL("Inverness Caledonian Thistle",11,2,7,50,20);

			//store the FootballClubNL objects in an ArrayList
			ArrayList<FootballClubNL> clubs = new ArrayList<FootballClubNL>();
			clubs.add(fc1);
			clubs.add(fc2);
			clubs.add(fc3);
			clubs.add(fc4);
			clubs.add(fc5);

			//serialize the ArrayList
			FootballClubFileWriter.serializeToDisk(clubs);
			
			//print the objects in the clubs ArrayList one to a line
			for (FootballClubNL club : clubs) {
			System.out.println(club);
			}
			
			//A FOUR
			//deserialize the ArrayList
			ArrayList<FootballClubNL> clubs2 = new ArrayList<FootballClubNL>();
			clubs2 = FootballClubFileWriter.deserializeFromDisk();
			System.out.println("\nDeserialized clubs2 ArrayList\n");
			for (FootballClubNL club2 : clubs) {
				System.out.println(club2);
			}
			
			//A SEVEN
			FootballClubFileWriter.writeToDisk(clubs);
	}
}
