/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;
import java.io.File;
import java.io.FileReader;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class EmailSend {
    static Properties emailProperties;
    static Session mailSession;
    static MimeMessage emailMessage;   
    public static void main(String args[]) 
    {
     
        Send("niranjankumar26081998@gmail.com","HTML","<h1>TEST JAVA MESSAGE</h1>");
    }
    public static void Send(String TO,String SUB,String MESS)
    {
        try
        {   
            File f=new File("C:\\AmritaCMSMail.html");
            FileReader fr=new FileReader(f);
            char cbuf[]=new char[100000];
            fr.read(cbuf);
            //String.copyValueOf(cbuf);
            String finalStr = String.copyValueOf(cbuf).replace("{name}", MESS);
            String emailPort = "587";//gmail's smtp port
            emailProperties = System.getProperties();
            emailProperties.put("mail.smtp.port", emailPort);
            emailProperties.put("mail.smtp.auth", "true");
            emailProperties.put("mail.smtp.starttls.enable", "true");
            mailSession = Session.getDefaultInstance(emailProperties, null);
            emailMessage = new MimeMessage(mailSession);
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(TO));
            emailMessage.setSubject(SUB);
            emailMessage.setContent(finalStr, "text/html");
            Transport transport = mailSession.getTransport("smtp");
            transport.connect("smtp.gmail.com","ninju26", "@@Sri#Rama");
            transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
            transport.close();
            System.out.println("Email sent successfully.");
        }
        catch(Exception e)
        {
            System.out.println("Email Failed!!!.");
            e.printStackTrace();
        }
    }
    
    
}
