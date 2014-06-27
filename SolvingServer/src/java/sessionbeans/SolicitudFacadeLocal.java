/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Solicitud;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Glass
 */
@Local
public interface SolicitudFacadeLocal {

    void create(Solicitud solicitud);

    void edit(Solicitud solicitud);

    void remove(Solicitud solicitud);

    Solicitud find(Object id);

    List<Solicitud> findAll();

    List<Solicitud> findRange(int[] range);

    int count();

    boolean crearSolicitud(String rut, String nombreReq, String obsevacion);

    List<Solicitud> buscarPorEstado(String estado);

    ArrayList<String> allOpenRequests();

    ArrayList<String> allClosedRequests();

    boolean closeRequest(String idSolicitud);
    
}
