/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.usach.client;

import java.awt.Image;
import java.io.File;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.xml.namespace.QName;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Service;
import javax.xml.ws.soap.MTOMFeature;
import javax.xml.ws.soap.SOAPBinding;
 
public class ImageClient{
 
	public static void main(String[] args) throws Exception {
 
	URL url = new URL("http://localhost:8080/server/image?wsdl");
        QName qname = new QName("http://ws.mkyong.com/", "ImageServerImplService");
 
        Service service = Service.create(url, qname);
        //ImageServer imageServer = service.getPort(ImageServer.class);
 
        /************  test download  ***************/
        //Image image = imageServer.downloadImage("rss.png");
 
        //display it in frame
        JFrame frame = new JFrame();
        frame.setSize(300, 300);
        //JLabel label = new JLabel(new ImageIcon(image));
        //frame.add(label);
        frame.setVisible(true);
 
        System.out.println("imageServer.downloadImage() : Download Successful!");
 
    }
 
}