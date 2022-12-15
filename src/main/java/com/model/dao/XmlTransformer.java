package com.model.dao;

import com.model.Admins;
import com.model.Users;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class XmlTransformer{
    public XmlTransformer() { }
    
    public void transform(String xslPath, Users users, StreamResult result) throws JAXBException, TransformerConfigurationException, TransformerException{
        // Step 1: Create TransformerFactory instance
        TransformerFactory tf = TransformerFactory.newInstance();
        
        // Step 2: Load the XSL source file into StreamSource
        StreamSource xslSource = new StreamSource(xslPath);
        
        // Step 3: Load the XML data source - using JAXB
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        JAXBSource xmlSource = new JAXBSource(jc, users);
        
        // Step 4: Create a transformer instance using xsl document
        Transformer transformer = tf.newTransformer(xslSource);
        
        // Step 5: transform
        transformer.transform(xmlSource, result);
        StreamResult systemOutResult = new StreamResult(System.out);
        transformer.transform(xmlSource, systemOutResult);        
    }
    
//    public void transform(String xslPath, Admins admins, StreamResult result) throws JAXBException, TransformerConfigurationException, TransformerException{
//        // Step 1: Create TransformerFactory instance
//        TransformerFactory tf = TransformerFactory.newInstance();
//        
//        // Step 2: Load the XSL source file into StreamSource
//        StreamSource xslSource = new StreamSource(xslPath);
//        
//        // Step 3: Load the XML data source - using JAXB
//        JAXBContext jc = JAXBContext.newInstance(Admins.class);
//        JAXBSource xmlSource = new JAXBSource(jc, admins);
//        
//        // Step 4: Create a transformer instance using xsl document
//        Transformer transformer = tf.newTransformer(xslSource);
//        
//        // Step 5: transform
//        transformer.transform(xmlSource, result);
//        StreamResult systemOutResult = new StreamResult(System.out);
//        transformer.transform(xmlSource, systemOutResult);        
//    }
}
