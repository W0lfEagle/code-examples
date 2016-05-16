import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;


public class ClientGUI {
	private static final String connectButtonText = "Connect";
	private static final String disconnectButtonText = "Disconnect";
	private static final String enterCommandButtonText = "Enter command";
	
	private JTextArea text; //responses from the server get shown here
	private JTextField field; //user entered commands go here
	private FootballLeagueClient client;
	private JButton connectButton;
	private JButton commandButton;
	private boolean connected; //keep track of whether we are connected to the server or not

	public ClientGUI()
	{
		connected = false;
		client = new FootballLeagueClient();
		field = new JTextField(40);
		connectButton = new JButton(connectButtonText);
		connectButton.addActionListener(new connectButtonAction());
		
		commandButton = new JButton(enterCommandButtonText);
		commandButton.addActionListener(new commandButtonAction());
		commandButton.setEnabled(false);//do not enable this button until the TextField has some text in it
		
		text = new JTextArea(25,52);
		text.setLineWrap(false);// need to set to false to make the horizontal scroller work

		JScrollPane scroller = new JScrollPane(text);
		scroller.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scroller.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		
		JFrame frame = new JFrame();
		JPanel panel = new JPanel();
		JPanel southPanel = new JPanel();
		
		southPanel.add(field);
		southPanel.add(commandButton); 
		panel.add(scroller);

		frame.getContentPane().add(connectButton, BorderLayout.NORTH);
		frame.getContentPane().add(panel, BorderLayout.CENTER);
		frame.getContentPane().add(southPanel, BorderLayout.SOUTH);
		
		frame.setSize(650,520);
		frame.setVisible(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//stop the command button being enabled when there is no text in the TextField
		field.getDocument().addDocumentListener(new EnableButtonListener());
		
		//make the command button the default button, meaning when you hit the enter key it'll be 'clicked'
		frame.getRootPane().setDefaultButton(commandButton);
	}
	
	private void displayError(Exception e) {
		text.append("ERROR: "+e.getMessage()+'\n');
	}
	
	private void append(String s) {
		text.append(s+'\n');
	}
	
	//if the TextField is empty, disable button. otherwise enable it
	private void disableCommandButtonIfTextFieldEmpty() {
		if (field.getText().length() > 0) {
			if (!commandButton.isEnabled()) {
				commandButton.setEnabled(true);
			}
		} else {
			if (commandButton.isEnabled()) {
				commandButton.setEnabled(false);
			}
		}
	}
	
	public static void main (String[] args)
	{
		ClientGUI gui = new ClientGUI();
	}

	//toggle the behavior and text of the connect/disconnect button
	private class connectButtonAction implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			if (!connected) {
				//connect
				try {
					//hardcoded to connect to localhost. change this line if you want to connect to a remote host
					String msg = client.connect("localhost");
					append(msg);
					connectButton.setText(disconnectButtonText);
					//change state
					connected = !connected;
				} catch (Exception e1) {
					displayError(e1);
				}
			} else {
				//disconnect
				try {
					client.disconnect();
					append("Disconnected.");
					connectButton.setText(connectButtonText);
					//change state
					connected = !connected;
				} catch (Exception e1) {
					displayError(e1);
				}
			}
		}	
	}
	
	private class commandButtonAction implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			try {
				//send user inputed command to server, display response in textfield
				append(client.sendCommand(field.getText()));
				//clear the text field so the user doesn't have to manually delete their last command to enter a new one
				field.setText("");
				//bring the keyboard focus back to where you're going to want to type stuff
				field.requestFocusInWindow();
			} catch (Exception e1) {
				displayError(e1);
			}
		}
		
	}
	
	private class EnableButtonListener implements DocumentListener {
		@Override
		public void changedUpdate(DocumentEvent e) {
			//Plain text components do not fire these events
		}

		@Override
		public void insertUpdate(DocumentEvent e) {
			disableCommandButtonIfTextFieldEmpty();
		}

		@Override
		public void removeUpdate(DocumentEvent e) {
			disableCommandButtonIfTextFieldEmpty();
		}
		
	}
}
