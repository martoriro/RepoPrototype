/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sessionbeans;

import entities.Requirimiento;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Glass
 */
@Local
public interface RequirimientoFacadeLocal {

    void create(Requirimiento requirimiento);

    void edit(Requirimiento requirimiento);

    void remove(Requirimiento requirimiento);

    Requirimiento find(Object id);

    List<Requirimiento> findAll();

    List<Requirimiento> findRange(int[] range);

    int count();
    
}
