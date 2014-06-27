/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.usach.server;

import entities.Empresa;
import entities.Requirimiento;
import entities.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import sessionbeans.EmpresaFacadeLocal;
import sessionbeans.RequirimientoFacade;
import sessionbeans.RequirimientoFacadeLocal;
import sessionbeans.SolicitudFacadeLocal;
import sessionbeans.UsuarioFacade;
import sessionbeans.UsuarioFacadeLocal;

/**
 *
 * @author Martín
 */
@WebService(serviceName = "SolvingWS")
public class SolvingWS {
    @EJB
    private SolicitudFacadeLocal solicitudFacade;
    @EJB
    private RequirimientoFacadeLocal requirimientoFacade;
    @EJB
    private EmpresaFacadeLocal empresaFacade;
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
        return usuarioFacade.login(rut, password);

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "allUsers")
    public ArrayList<ArrayList<String>> allUsers() {
        //TODO write your implementation code here:
        return usuarioFacade.todosUsuarios();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "allrequirimientos")
    public ArrayList<String> allrequirimientos() {
        //TODO write your implementation code here:
        return requirimientoFacade.listarRequirimientos();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "crearSolicitud")
    public boolean crearSolicitud(@WebParam(name = "rut") String rut, @WebParam(name = "nombreReq") String nombreReq, @WebParam(name = "observacion") String observacion) {
        //TODO write your implementation code here:
        return solicitudFacade.crearSolicitud(rut, nombreReq, observacion);
    }
}
