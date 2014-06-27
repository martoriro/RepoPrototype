/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Empresa;
import entities.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Glass
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> implements UsuarioFacadeLocal {
    @EJB
    private EmpresaFacadeLocal empresaFacade;

    @PersistenceContext(unitName = "RepoProtoServerPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    @Override
    public String login(String rut, String password) {
        Usuario newUser = null;
        newUser = UsuarioFacade.super.find(rut);
        if (newUser == null) {
            return "";
        } else {
            if (password.equals(newUser.getPassword())) {
                return newUser.getRole();
            } else {
                return "";
            }
        }
    }

    @Override
    public ArrayList<String> todosUsuarios() {

        ArrayList<String> informacionUser = new ArrayList<>();
        String fullUser;
        Empresa newEmpresa;

        List<Usuario> allUsers = UsuarioFacade.super.findAll();

        for (int i = 0; i < allUsers.size(); i++) {
            fullUser = allUsers.get(i).getRut();
            fullUser += ",";
            fullUser += allUsers.get(i).getNombreuser();
            fullUser += ",";
            fullUser += allUsers.get(i).getApellidopat();
            fullUser += ",";
            fullUser += allUsers.get(i).getApellidomat();
            fullUser += ",";
            fullUser += allUsers.get(i).getRole();
            fullUser += ",";
            newEmpresa = empresaFacade.find(allUsers.get(i).getIdempresa().getIdempresa());
            fullUser += newEmpresa.getNombreempresa();

            informacionUser.add(fullUser);
        }

        return informacionUser;
    }

}
