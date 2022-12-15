package com.model;

import java.io.Serializable;
import java.util.*;
import javax.xml.bind.annotation.*;

@XmlRootElement(name = "admins")
@XmlAccessorType(XmlAccessType.FIELD)
public class Admins implements Serializable{
    @XmlElement(name = "admin")
    private List<Admin> admins = new ArrayList<>();

    public Admins() { }
    
    public void add(Admin admin){
        this.admins.add(admin);
    }
    
    public Admin admin(String email, String password){
        return this.admins.stream().filter(admin -> admin.login(email, password)).findAny().orElse(null);
    }
    
    public Admin admin(String email){
        return this.admins.stream().filter(admin -> admin.match(email)).findAny().orElse(null);
    }
    
    public Admin admin(int ID){
        return this.admins.stream().filter(admin -> admin.match(ID)).findAny().orElse(null);
    }

    public List<Admin> getAdmins() {
        return admins;
    }

    public void setAdmins(List<Admin> admins) {
        this.admins = admins;
    }   
    
    public void remove(Admin other){
        admins.removeIf(admin -> admin.match(other));
    }
    
    public void show(){
        this.admins.forEach(admin -> System.out.println(admin));
    } 
}