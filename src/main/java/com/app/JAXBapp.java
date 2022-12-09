package com.app;

import com.utils.In;
import com.model.User;
import com.model.Users;
import com.model.dao.UserDAO;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.xml.bind.JAXBException;

/* 
 * Run Maven Standalone Java app
 * (Assuming JAXBapp is the main class)
 * (Assuming com.app is the main class package)
 *
 * In CLI Execute: mvn exec:java -Dexec.mainClass="com.app.JAXBapp"
 */
public class JAXBapp {
    public static void main(String[] args) throws JAXBException, IOException{
        JAXBapp app = new JAXBapp();
        app.menu();
    }
    
    private String fileName = "C:\\Users\\236339\\Documents\\NetBeansProjects\\prototype\\src\\main\\webapp\\WEB-INF\\users.xml";
    private Users users;
    private UserDAO userDAO;
    
    public JAXBapp() throws JAXBException, FileNotFoundException{  
        System.out.println("Loading JAXB app ...");
        userDAO = new UserDAO();
        userDAO.setFileName(fileName);
        users = userDAO.getUsers();
    }
    
    private int readID() {
        System.out.print("ID: ");
        return In.nextInt();
    }
    
    private String readString(String prompt) {
        System.out.print(prompt);
        return In.nextLine();
    }
    
    private void read() {
        System.out.println("READ\t>> ");
        int ID = readID();
        users = userDAO.getUsers();
        User user = users.user(ID);
        
        if (user != null) {
            System.out.println(" User "+ user.getName() +" record: ");
            System.out.println(user);
        } else {
            System.out.println(" User "+ ID +" record does not exist");
        }
    }
    
    private void create() throws JAXBException, IOException{
        System.out.println("CREATE\t>> ");
        String name = readString("Name: ");
        String email = readString("Email: ");
        String password = readString("Password: ");
        String dob = readString("Date of Birth: ");

        User user = new User(name, email, password, dob);
        User xmlUser = users.user(email);
        users = userDAO.getUsers();
        
        if (xmlUser != null) {
            System.out.println(" User "+ name +" record already exists");
        } else {
            System.out.println(" User "+ name +" record added to XML");
            users.add(user);
            userDAO.save(users, fileName);
        }
    }
    
    private void update() throws JAXBException, IOException{
        System.out.println("UPDATE\t>> ");
        int ID = readID();
        String password = readString("Password: ");
        String regex = "[A-Z][a-z]{5,}\\d{2,}";
        
        while(!(password.matches(regex))) {
            System.out.println("Password format not acceptable - try again");
            password = readString("Password: ");
        }
        
        users = userDAO.getUsers(); 

        User user = users.user(ID);
        
        
        if (user != null) {
            System.out.println(" Updating " + user.getName() + "'s password ...");
            user.setPassword(password);
            userDAO.update(users, user);
        } else {
            System.out.println(" User "+ user.getName() +" record does not exist");
        }
    }
    
    private void delete() throws JAXBException, IOException{
        System.out.println("DELETE\t>> ");
        int ID = readID();
       
        users = userDAO.getUsers();
        User user = users.user(ID);   
        
        if(user != null) {
            System.out.println("Deleting " + user.getName() + "'s record ...");
            userDAO.delete(users, user);
        } else {
            System.out.println(" User "+ ID +" record does not exist");
        }
    }
    
    private void view() {
        System.out.println("VIEW\t>> ");
        System.out.println("ID\tNAME\t\tEMAIL\t\t\tD.O.B.");
        users = userDAO.getUsers();
        users.show();
    }
    
    private char readChoice() {
        System.out.print("Choice (c/r/u/d/v/x): ");
        return In.nextChar();
    }
    
    private void help() {
        System.out.println("c - Add user");
        System.out.println("r - Find user by ID");
        System.out.println("u - Update user password by ID");
        System.out.println("d - Delete user by ID");
        System.out.println("v - View all users");
        System.out.println("x - Exit");
    }
    
    private void menu() throws JAXBException, IOException{
        char c;
        
        while((c = readChoice()) != 'x'){
            switch(c){
                case 'c': create(); break;
                case 'r': read(); break;
                case 'u': update(); break;
                case 'd': delete(); break;
                case 'v': view(); break;
                default: help();
            }
        }
    }
}