package com.rest;

import com.model.User;
import com.model.Users;
import com.model.dao.UserDAO;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBException;

@Path("userapi")
public class UserService {

    @Context
    private ServletContext application;

    private UserDAO getUserDAO() throws JAXBException, FileNotFoundException {
        synchronized (application) {
            UserDAO userDAO = (UserDAO) application.getAttribute("userDAO");
            if (userDAO == null) {
                userDAO = new UserDAO();
                userDAO.setFileName(application.getRealPath("/WEB-INF/users.xml"));
                application.setAttribute("userDAO", userDAO);
            }
            return userDAO;
        }
    }

    // Return hello message
    @GET // http://localhost:8080/prototype/rest/userapi
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from User Rest Web Service";
    }

    // Return all users
    @GET
    @Path("users") // http://localhost:8080/demo/rest/userapi/users
    @Produces(MediaType.APPLICATION_XML)
    public Users getUsers() throws JAXBException, FileNotFoundException {
        return getUserDAO().getUsers();
    }

    // Return a user by ID
//    @GET
//    @Path("user/ID/{ID}") //http://localhost:8080/demo/rest/userapi/user/ID/608493
//    @Produces(MediaType.APPLICATION_XML)
//    public User getUser(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException {
//        return getUserDAO().getUsers().user(ID);
//    }

    @GET
    @Path("user/ID/{ID}") //http://localhost:8080/demo/rest/userapi/user/ID/608493
    @Produces(MediaType.APPLICATION_XML)
    public Users getUserAsList(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException {
       User user =getUserDAO().getUsers().user(ID);
       Users users= new Users();
       users.add(user);
        return users;
    }

    // Delete a user by ID
    // ==========================================
    // TEST IF NOT DELETE AND THE PROMPT IS SHOWN
    // ==========================================
    @DELETE
    @Path("user/delete/{ID}")
    @Produces(MediaType.TEXT_PLAIN)
    public String deleteUser(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException, IOException {
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        User user = users.user(ID);
        userDAO.delete(users, user);
        return "<success> user deleted successfully</success>";
    }

    // Add new user
    @GET
    @Path("adduser")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response addUser() throws JAXBException, FileNotFoundException {
        User user = new User("David", "dav@example.com", "Newrest123", "2000-02-02");
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        users.add(user);
        userDAO.marshal(users);
        return Response.status(200).entity(user).build();
    }

    // Update user's password using by ID
    @GET
    @Path("user/updatePassword/{ID}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public String updatePassword(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException, IOException {
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        User user = users.user(ID);
        user.setPassword("HelloTeam123");
        userDAO.update(users, user);
        return "<success> user password updated successfully</success>";
    }
}
