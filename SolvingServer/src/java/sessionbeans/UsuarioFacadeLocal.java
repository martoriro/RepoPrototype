/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Glass
 */
@Local
public interface UsuarioFacadeLocal {

    void create(Usuario usuario);

    void edit(Usuario usuario);

    void remove(Usuario usuario);

    Usuario find(Object id);

    List<Usuario> findAll();

    List<Usuario> findRange(int[] range);

    int count();
    
    String login(String rut, String password);
    
    ArrayList<String> todosUsuarios();

    boolean addUser(String rut, String password, String nombre, String apellidoPat, String apellidoMat, String rol, String empresa);

    boolean deleteUser(String rut);

    String buscarUsuario(String rut);

    boolean cambiarPassword(String rut, String nuevaPassword);
}
