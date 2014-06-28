/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Requirimiento;
import entities.Solicitud;
import entities.Usuario;
import java.text.DateFormat;
import java.util.ArrayList;
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

    @Override
    public List<Solicitud> buscarPorEstado(String estado) {
        Query query;
        query = em.createNamedQuery("Solicitud.findByEstado").
                setParameter("estado", estado);

        return query.getResultList();
    }

    @Override
    public ArrayList<String> allOpenRequests() {
        ArrayList<String> solicitudes = new ArrayList<>();
        String textoSolicitud;

        List<Solicitud> allOpen = buscarPorEstado("abierta");
        
        DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);
        Date fecha;

        for (int i = 0; i < allOpen.size(); i++) {
            textoSolicitud = Integer.toString(allOpen.get(i).getIdsolicitud());
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getRut().getIdempresa().getNombreempresa();
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getIdrequirimiento().getNombrereq();
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getEstado();
            textoSolicitud += ",";
            textoSolicitud += dfDateMedium.format(allOpen.get(i).getFecha());
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getObservacion();

            solicitudes.add(textoSolicitud);
        }

        return solicitudes;
    }

    @Override
    public ArrayList<String> allClosedRequests() {
        ArrayList<String> solicitudes = new ArrayList<>();
        String textoSolicitud;

        List<Solicitud> allOpen = buscarPorEstado("cerrada");
        DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);

        for (int i = 0; i < allOpen.size(); i++) {
            textoSolicitud = Integer.toString(allOpen.get(i).getIdsolicitud());
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getRut().getIdempresa().getNombreempresa();
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getIdrequirimiento().getNombrereq();
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getEstado();
            textoSolicitud += ",";
            textoSolicitud += dfDateMedium.format(allOpen.get(i).getFecha());
            textoSolicitud += ",";
            textoSolicitud += allOpen.get(i).getObservacion();

            solicitudes.add(textoSolicitud);
        }

        return solicitudes;
    }

    @Override
    public boolean closeRequest(String idSolicitud) {
        Solicitud searchSolicitud = null;
        searchSolicitud = SolicitudFacade.super.find(Integer.parseInt(idSolicitud));

        searchSolicitud.setEstado("cerrada");
        SolicitudFacade.super.edit(searchSolicitud);

        return true;
    }

    @Override
    public ArrayList<String> allUserRequest(String rut) {
        Usuario searchUsuario = usuarioFacade.find(rut);

        ArrayList<String> solicitudes = new ArrayList<>();
        String textoSolicitud;

        List<Solicitud> usuarioSolicitutedes = buscarSolicitudPorRut(searchUsuario);
        DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);

        for (int i = 0; i < usuarioSolicitutedes.size(); i++) {
            textoSolicitud = Integer.toString(usuarioSolicitutedes.get(i).getIdsolicitud());
            textoSolicitud += ",";
            textoSolicitud += usuarioSolicitutedes.get(i).getRut().getRut();
            textoSolicitud += ",";
            textoSolicitud += usuarioSolicitutedes.get(i).getIdrequirimiento().getNombrereq();
            textoSolicitud += ",";
            textoSolicitud += usuarioSolicitutedes.get(i).getEstado();
            textoSolicitud += ",";
            textoSolicitud += dfDateMedium.format(usuarioSolicitutedes.get(i).getFecha());
            textoSolicitud += ",";
            textoSolicitud += usuarioSolicitutedes.get(i).getObservacion();

            solicitudes.add(textoSolicitud);
        }

        return solicitudes;
    }

    @Override
    public List<Solicitud> buscarSolicitudPorRut(Usuario rut) {
        Query query;
        query = em.createNamedQuery("Solicitud.findByRut").
                setParameter("rut", rut);

        return query.getResultList();
    }

    @Override
    public String datosSolicitud(int id) {
        Solicitud searchSolicitud = SolicitudFacade.super.find(id);
        String textoSolicitud;
        
        DateFormat dfDateMedium = DateFormat.getDateInstance(DateFormat.MEDIUM);
        
        textoSolicitud = Integer.toString(searchSolicitud.getIdsolicitud());
        textoSolicitud += ",";
        textoSolicitud += searchSolicitud.getRut().getRut();
        textoSolicitud += ",";
        textoSolicitud += searchSolicitud.getIdrequirimiento().getNombrereq();
        textoSolicitud += ",";
        textoSolicitud += searchSolicitud.getEstado();
        textoSolicitud += ",";
        textoSolicitud += dfDateMedium.format(searchSolicitud.getFecha());
        textoSolicitud += ",";
        textoSolicitud += searchSolicitud.getObservacion();

        return textoSolicitud;
    }

}
