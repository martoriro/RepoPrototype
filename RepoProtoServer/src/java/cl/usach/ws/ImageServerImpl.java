/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.usach.ws;

import cl.usach.ws.ImageServer;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
 
import javax.imageio.ImageIO;
import javax.jws.WebService;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.soap.MTOM;
 
//Service Implementation Bean
@MTOM
@WebService(endpointInterface = "cl.usach.ws.ImageServer")
public class ImageServerImpl implements ImageServer{
 
	@Override
	public Image downloadImage(String name) {
 
		try {
 
			File image = new File("C:\\Users\\Martín\\Pictures\\Camera Roll\\" + name);
			return ImageIO.read(image);
 
		} catch (IOException e) {
 
			e.printStackTrace();
			return null; 
 
		}
	}
 
	@Override
	public String uploadImage(Image data) {
 
		if(data!=null){
			//store somewhere
			return "Upload Successful";
		}
 
		throw new WebServiceException("Upload Failed!");
 
	}
 
}