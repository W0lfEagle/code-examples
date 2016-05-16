import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class FootballLeagueServer {
	private int portNumber = 1983;
	private Socket clientSocket;
	private ServerSocket serverSocket;
	private PrintWriter out;
	private BufferedReader in;
	private String filename = "2013-14_league_table.csv";
	private static final String EOM = "9aada060-b16d-4517-a310-efd259f44e28"; //The magic string that signifies End Of Message. generated using UUID.randomUUID(). Probably overkill for our needs.
	private FootballLeagueEngine engine;

	public static String getEOM() {
		return EOM;
	}

	public FootballLeagueServer() {
		init();

		try {
			startServer();
		} catch (IOException e) {
			System.err.println("Unrecoverable error whilst starting the server: " + e.getMessage());
		}
	}

	private void init() {
		//ArrayList<FootballClub> league = FootballLeagueCSVParser.parseLeagueTable(filename);
		ArrayList<FootballClub> league = new ArrayList<FootballClub>();
		engine = new FootballLeagueEngine(league);
	}

	private void startServer() throws IOException {
		serverSocket = new ServerSocket(portNumber);
		clientSocket = serverSocket.accept();

		in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
		out = new PrintWriter(clientSocket.getOutputStream(), true);

		//we only make it this far if the code above doesn't throw an exception
		welcomeClient();

		//user interaction starts (and ends) here
		mainLoop();

		//shut down
		closeAll();
	}

	private void welcomeClient() {
		//welcome the client and show the available commands
		String commands = engine.getAvailableCommands();
		sendOutputToClient("Welcome to the Football League Server. Available commands:\n" + commands);
	}

	//our shutdown method. close all open streams
	private void closeAll() {
		//out of the loop. all done, close the connection
		try {
			in.close();
			out.close();
			clientSocket.close();
		} catch (IOException e) {
			System.err.println("Error while shutting down: "+e.getMessage());
		}
	}

	private void mainLoop() {
		//receive and respond to input
		try {
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				String output = engine.parseCommand(inputLine.trim());
				sendOutputToClient(output);
			}
		} catch (IOException e) {
			System.err.println("Error reading from client: "+e.getMessage());
		}
	}

	private void sendOutputToClient(String s) {
		out.println(s);
		out.println(EOM); //The client won't know it has reached the end of our message without this
	}

	public static void main(String[] args) throws IOException {
		FootballLeagueServer server = new FootballLeagueServer();
	}
}
