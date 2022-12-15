package com.model.dao;

import com.model.Admin;
import com.model.Admins;
import java.io.*;
import javax.xml.bind.*;

public class AdminDAO implements Serializable{
    private Admins admins;
    private String fileName;
    
    public AdminDAO(){ }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        
        admins = (Admins) um.unmarshal(fin);
    }
    
    public void save(Admins admins, String filename) throws JAXBException, FileNotFoundException, IOException{
        this.admins = admins;
        this.fileName = filename;
        
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filename);
        m.marshal(admins, fout);
        //m.marshal(users, System.out);  //this is used to prove that the objects are mapped to XML
        fout.close();
    }
    
    public Admins read(String filename) throws JAXBException, FileNotFoundException{
        this.fileName = filename;
        
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        admins = (Admins) um.unmarshal(fin);
        
        return admins;
    }
    
    public void update(Admins admins, Admin admin) throws JAXBException, IOException{
        this.admins = admins;
        this.admins.remove(admin);
        save(this.admins, fileName);
        
        this.admins.add(admin);
        save(this.admins, fileName);
    }
    
    public void delete(Admins admins, Admin admin) throws JAXBException, IOException{
        this.admins = admins;
        this.admins.remove(admin);
        save(this.admins, fileName);
    }

    public Admins getAdmins(){
        return this.admins;
    }
    
    public String getFilePath() {
        return fileName;
    }

    public void setAdmins(Admins admins) {
        this.admins = admins;
    }

    public void setFilePath(String fileName) {
        this.fileName = fileName;
    }
}