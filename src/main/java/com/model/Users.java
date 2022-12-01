package com.model;

import java.io.Serializable;
import java.util.*;

public class Users implements Serializable{
    private List<User> users = new ArrayList<>();

    public Users() { }
    
    public void add(User user){
        this.users.add(user);
    }
    
    public User user(String email, String password){
        return this.users.stream().filter(user -> user.login(email, password)).findAny().orElse(null);
    }
    
    public User user(String email){
        return this.users.stream().filter(user -> user.match(email)).findAny().orElse(null);
    }
    
    public User user(int ID){
        return this.users.stream().filter(user -> user.match(ID)).findAny().orElse(null);
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }   
}