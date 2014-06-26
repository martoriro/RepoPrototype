/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.usach.endpoint;
 
import javax.xml.ws.Endpoint;
import cl.usach.ws.ImageServerImpl;
 
//Endpoint publisher
public class ImagePublisher{
 
    public static void main(String[] args) {
 
	Endpoint.publish("http://localhost:8080/ws/image", new ImageServerImpl());
 
	System.out.println("Server is published!");
 
    }
 
}