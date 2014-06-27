/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Requirimiento;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Glass
 */
@Stateless
public class RequirimientoFacade extends AbstractFacade<Requirimiento> implements RequirimientoFacadeLocal {
    @PersistenceContext(unitName = "RepoProtoServerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RequirimientoFacade() {
        super(Requirimiento.class);
    }

    @Override
    public ArrayList<String> listarRequirimientos() {
        ArrayList<String> requirimientos = new ArrayList<String>();
        List<Requirimiento> todosRequirimientos;
        todosRequirimientos = RequirimientoFacade.super.findAll();
        
        for(int i = 0; i < todosRequirimientos.size(); i++){
            requirimientos.add(todosRequirimientos.get(i).getNombrereq());
        }
        
        return requirimientos;
    }
    
    
}
