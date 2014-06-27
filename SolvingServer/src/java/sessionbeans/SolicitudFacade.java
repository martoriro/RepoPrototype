/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Requirimiento;
import entities.Solicitud;
import entities.Usuario;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Glass
 */
@Stateless
public class SolicitudFacade extends AbstractFacade<Solicitud> implements SolicitudFacadeLocal {
    @EJB
    private UsuarioFacadeLocal usuarioFacade;
    @PersistenceContext(unitName = "RepoProtoServerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SolicitudFacade() {
        super(Solicitud.class);
    }

    @Override
    public boolean crearSolicitud(String rut, String nombreReq, String obsevacion) {
        Usuario newUsuario = usuarioFacade.find(rut);
        
        Query query;
        query = em.createNamedQuery("Requirimiento.findByNombrereq").
                setParameter("nombrereq", nombreReq);
        
        List<Requirimiento> requirimientoBuscado = query.getResultList();
        Requirimiento newRequirimiento = requirimientoBuscado.get(0);
        Date fecha;
        fecha = new Date();
        
        Solicitud nuevaSolicitud = new Solicitud(null);
        nuevaSolicitud.setEstado("pendiente");
        nuevaSolicitud.setRut(newUsuario);
        nuevaSolicitud.setIdrequirimiento(newRequirimiento);
        nuevaSolicitud.setObservacion(obsevacion);
        nuevaSolicitud.setFecha(fecha);
        
        SolicitudFacade.super.create(nuevaSolicitud);
        
        return true;
    }
    
    
}
