/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.usach.server;

import javax.ejb.EJB;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import sessionbeans.UsuarioFacade;
import sessionbeans.UsuarioFacadeLocal;

/**
 *
 * @author Martín
 */
@WebService(serviceName = "SolvingWS")
public class SolvingWS {
    @EJB
    private UsuarioFacadeLocal usuarioFacade;

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "rut") String rut, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        System.out.println("pico");
        return usuarioFacade.login(rut, password);
        
    }
}
