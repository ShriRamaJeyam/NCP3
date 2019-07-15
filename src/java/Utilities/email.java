package java.Utilities;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.InputStreamReader;

public class email
{
public static void main(String args[])
{
// Java program to send email 
	try{
    	String prg = "import smtplib"
    			+ "\n"
    			+ "\ngmail_user = 'ninju26@gmail.com'"
    			+ "\ngmail_password = '@@Sri#Rama'"
    			+ "\n"
    			+ "\nsent_from = gmail_user"
    			+ "\nto = ['umasubbiah19@gmail.com']"
    			+ "\nsubject = 'OMG Super Important Message'"
    			+ "\nbody = 'Hey, whats up?\n\n- You'"
    			+ "\n"
    			+ "\nemail_text = "+"\"\"\""
    			+ "\nFrom: %s"
    			+ "\nTo: %s"
    			+ "\nSubject: %s"
    			+ "\n"
    			+ "\n%s"
    			+ "\n"+"\"\"\""+" % (sent_from, ', '.join(to), subject, body)"
    			+ "\n"
    			+ "\ntry:"
    			+ "\n    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)"
    			+ "\n    server.ehlo()"
    			+ "\n    server.login(gmail_user, gmail_password)"
    			+ "\n    server.sendmail(sent_from, to, email_text)"
    			+ "\n    server.close()"
    			+ "\n"
    			+ "\n    print ('Email sent!')"
    			+ "\nexcept:"
    			+ "\n    print ('Something went wrong...')";
    	
    	BufferedWriter out = new BufferedWriter(new FileWriter("test1.py"));
    	out.write(prg);
    	out.close();
    	Process p = Runtime.getRuntime().exec("/usr/local/bin/python3 test1.py ");
    	BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
    	System.out.println("exec");
    	}catch(Exception e){}
}
}