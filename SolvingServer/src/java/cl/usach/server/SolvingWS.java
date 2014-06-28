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
    public ArrayList<String> allUsers() {
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

    /**
     * Web service operation
     */
    @WebMethod(operationName = "nuevoUsuario")
    public boolean nuevoUsuario(@WebParam(name = "rut") String rut, @WebParam(name = "password") String password, @WebParam(name = "nombre") String nombre, @WebParam(name = "Ap") String Ap, @WebParam(name = "Am") String Am, @WebParam(name = "rol") String rol, @WebParam(name = "empresa") String empresa) {
        //TODO write your implementation code here:
        return usuarioFacade.addUser(rut, password, nombre, Ap, Am, rol, empresa);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "borrarUsuario")
    public boolean borrarUsuario(@WebParam(name = "rut") String rut) {
        //TODO write your implementation code here:
        return usuarioFacade.deleteUser(rut);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "allOpenRequests")
    public ArrayList<String> allOpenRequests() {
        //TODO write your implementation code here:
        return solicitudFacade.allOpenRequests();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "allClosedRequests")
    public ArrayList<String> allClosedRequests() {
        //TODO write your implementation code here:
        return solicitudFacade.allClosedRequests();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "closeRequest")
    public boolean closeRequest(@WebParam(name = "idSolicitud") String idSolicitud) {
        //TODO write your implementation code here:
        return solicitudFacade.closeRequest(idSolicitud);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "buscarUsuario")
    public String buscarUsuario(@WebParam(name = "rut") String rut) {
        //TODO write your implementation code here:
        return usuarioFacade.buscarUsuario(rut);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "allUserRequest")
    public ArrayList<String> allUserRequest(@WebParam(name = "rut") String rut) {
        //TODO write your implementation code here:
        System.out.println(solicitudFacade.allUserRequest(rut).size());
        return solicitudFacade.allUserRequest(rut);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "datosSolicitud")
    public String datosSolicitud(@WebParam(name = "id") int id) {
        //TODO write your implementation code here:
        System.out.println(solicitudFacade.datosSolicitud(id));
        return solicitudFacade.datosSolicitud(id);
    }
}
