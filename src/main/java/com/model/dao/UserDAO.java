package com.model.dao;

import com.model.User;
import com.model.Users;
import java.io.*;
import javax.xml.bind.*;

public class UserDAO implements Serializable{
    private Users users;
    private String fileName;
    
    public UserDAO(){ }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        
        users = (Users) um.unmarshal(fin);
    }
    
    public void save(Users users, String filename) throws JAXBException, FileNotFoundException, IOException{
        this.users = users;
        this.fileName = filename;
        
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filename);
        m.marshal(users, fout);
        //m.marshal(users, System.out);  //this is used to prove that the objects are mapped to XML
        fout.close();
    }
    
    public Users read(String filename) throws JAXBException, FileNotFoundException{
        this.fileName = filename;
        
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        users = (Users) um.unmarshal(fin);
        
        return users;
    }
    
    public void update(Users users, User user) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(user);
        save(this.users, fileName);
        
        this.users.add(user);
        save(this.users, fileName);
    }
    
    public void delete(Users users, User user) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(user);
        save(this.users, fileName);
    }

    public Users getUsers(){
        return this.users;
    }
    
    public String getFilePath() {
        return fileName;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public void setFilePath(String fileName) {
        this.fileName = fileName;
    }
}