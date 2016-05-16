//package hangman;
//Engel_130190747_CO2220cw1

import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.Random;

/*
    This class will play a game of Hangman with the user.
    The user is asked to guess the word that the game has chosen.
    The user has to guess the word one letter at a time.
    The user has a fixed number of guesses.
    After each guess the game shows the user the result of the guess, which is one of three things
        -- the guessed letter is not in the word, and is added to the wrong guesses, which are shown to the user at every go
        -- the guessed letter is in the word. so the word is updated and shown to the user
        -- the letter has already been guessed, so the user is reminded that they have already tried that letter
    If the word is complete before or when the user's guesses have all been made, then the game tells the user they have won
    If the word is not complete when the user's guesses have all been made, then the game tells the user they have lost.
*/


public class Hangman {
    Scanner userInput;
	private Set<Character> wrongGuesses;
	private String[] answers = {"leverets", "hatchlings", "puppies", "kittens", "pullets", "goslings"};
	private String answer;
	private String guessed;
	private int maxTurns;
	private int currentTurns;
	private boolean inProgress;
	private char nextGuess;
	private boolean gameWin;

	public Hangman() {
		userInput = new Scanner(System.in);
		wrongGuesses = new HashSet<Character>();
		inProgress = false;
		gameWin = false;
		maxTurns = 14;
		currentTurns = 0;

		//ALTERED CODE
		/*answer = answers[0]*/
		// Call getAnswer() to select a random index if the answers array
		answer = answers[getAnswer(answers.length)];
		//ALTERED CODE

		//set guessed to the correct number of dashes
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < answer.length(); i++) {
			sb.append('-');
		}
		guessed = sb.toString();
	}

	// ADDED CODE
	/* choose a word from the answers array */
	private int getAnswer(int n) {
		Random r = new Random();
		return r.nextInt(n);
		//TEST CODE (prints the index of the chosen word)
		/*int i = r.nextInt(n);
		System.out.println(i);
		return i;*/
	}
	//ADDED CODE


	/* start a new game */
	public void startGame() {
		inProgress = true;
		startGameLoop();
	}

	/* the game loop. this method is the heart of the game */
	private void startGameLoop() {
		printInstructions();
		while(inProgress) {
			printStatus();
			acceptGuess();
			checkStatus();
		}
		printWinOrLose();
	}

	private void printInstructions() {
		System.out.println("Guess the word one letter at a time until you win or run out of turns. Good luck!");
	}

	private void printWinOrLose() {
		if (gameWin) {
			System.out.println("You win! The answer was " + answer);
		} else {
			System.out.println("You lose.");
		}
	}

	private void printStatus () {
		System.out.println("Guesses left: " + (maxTurns - currentTurns));
		System.out.println("Current status: " + guessed);
		System.out.println("Wrong guesses: " + getWrongAnswers());
	}

	/* get the next character from the player */
	private void acceptGuess() {
		System.out.println("Next guess: ");

		String temp = userInput.next();
		nextGuess = temp.charAt(0);
	}

	/* check what state the game is in */
	private void checkStatus() {
		//if already guessed, say already guessed.
		if (wrongGuesses.contains(nextGuess)) {
			System.out.println("You already guessed that!");
			return;
		}

		//if guess is not in answer, update number of turns played and add guess to wrong guesses
		//otherwise update the guessed variable
		if (answer.indexOf(nextGuess) < 0) {
			++currentTurns;
			wrongGuesses.add(nextGuess);
		} else {
			updateGuessStatus();
		}

		//check to see if the player has won or lost
		if (answer.equals(guessed)) {
			gameWin = true;
			inProgress = false;
		}
		if (currentTurns == maxTurns) {
			inProgress = false;
		}
	}

	/* update the guessed variable when there is a correct guess made */
	private void updateGuessStatus() {
		//replace - with nextGuess where appropriate
		int index = answer.indexOf(nextGuess);
		int lastIndex = answer.lastIndexOf(nextGuess);

		StringBuilder sb = new StringBuilder(guessed);
		if (index != lastIndex) { //more than one instance of the guess in the answer
			//swap out in a loop
			while (index != -1) {
				sb.setCharAt(index, nextGuess);
				int i = answer.indexOf(nextGuess, (index+1));
				index = i;
			}
		} else { //letter only appears once
			//swap out just that one
			sb.setCharAt(index, nextGuess);
		}
		guessed = sb.toString();
	}

	/* build a text representation of all the incorrect guesses */
	private String getWrongAnswers() {
		if (wrongGuesses.size() > 0) {
			StringBuilder sb = new StringBuilder();
			sb.append('(');
			for(Character c : wrongGuesses) {
				sb.append(c + ",");
			}
			sb.deleteCharAt(sb.length()-1); //delete trailing comma
			sb.append(')');

			return sb.toString();
		} else {
			return "<none>";
		}
	}

	public static void main(String[] args) {
		Hangman h = new Hangman();
		h.startGame();
	}
}
