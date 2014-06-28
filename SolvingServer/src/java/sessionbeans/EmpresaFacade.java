/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Empresa;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Glass
 */
@Stateless
public class EmpresaFacade extends AbstractFacade<Empresa> implements EmpresaFacadeLocal {
    @PersistenceContext(unitName = "RepoProtoServerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmpresaFacade() {
        super(Empresa.class);
    }

    @Override
    public Empresa buscarPorNombreEmp(String nombre) {
        Empresa nuevaEmpresa = null;
        List<Empresa> listaEmpresa;
        Query query;
        query = em.createNamedQuery("Empresa.findByNombreempresa").
                setParameter("nombreempresa", nombre);
        
        listaEmpresa = query.getResultList();
        nuevaEmpresa = listaEmpresa.get(0);
        
        return nuevaEmpresa;
    }

    @Override
    public boolean nuevaEmpresa(String nombreEmpresa) {
        
        Empresa nuevaEmpresa = new Empresa(null);
        nuevaEmpresa.setNombreempresa(nombreEmpresa);
        
        EmpresaFacade.super.create(nuevaEmpresa);
        
        return true;
    }

    @Override
    public ArrayList<String> todasEmpresas() {
        ArrayList<String> empresasString = new ArrayList<>();
        String empresaNombre;

        List<Empresa> allEmpresas = EmpresaFacade.super.findAll();

        for (int i = 0; i < allEmpresas.size(); i++) {
            empresaNombre = allEmpresas.get(i).getNombreempresa();
            empresasString.add(empresaNombre);
        }
        return empresasString; 
    }
    
    
    
    
    
}
