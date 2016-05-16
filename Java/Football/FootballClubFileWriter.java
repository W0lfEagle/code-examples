/* Name: Wilford Engel
 * Student Number: 130190747
 * Date: 08/03/2015
 */

//package parta;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class FootballClubFileWriter {

	private static final String filename_1 = "FootballClub.ser";
	private static final String filename_2 = "FootballClub.txt"; //Use for question 5

	public static void serializeToDisk(ArrayList<FootballClubNL> clubs) throws IOException {
			FileOutputStream fos = new FileOutputStream(filename_1);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(clubs);
			fos.close();
			oos.close();
	}
	
	//A THREE
	public static ArrayList<FootballClubNL> deserializeFromDisk() {	
		ArrayList<FootballClubNL> deser = new ArrayList<FootballClubNL>();
		try {
			FileInputStream fileIn = new FileInputStream(filename_1);
			ObjectInputStream objectIn = new ObjectInputStream(fileIn);
			deser = (ArrayList<FootballClubNL>) objectIn.readObject(); //unchecked cast
			fileIn.close();
			objectIn.close();			
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
		return deser;
	}
	
	//A FIVE
	public static void writeToDisk(ArrayList<FootballClubNL> clubs) {
		try {
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(
				    new FileOutputStream(filename_2), "UTF-8")); //A SIX
			
			for (FootballClubNL club : clubs) {
				String clubString = club.toString();
				out.write(clubString);
				out.newLine();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
