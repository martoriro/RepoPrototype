/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Glass
 */
@Entity
@Table(name = "requirimiento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requirimiento.findAll", query = "SELECT r FROM Requirimiento r"),
    @NamedQuery(name = "Requirimiento.findByIdrequirimiento", query = "SELECT r FROM Requirimiento r WHERE r.idrequirimiento = :idrequirimiento"),
    @NamedQuery(name = "Requirimiento.findByNombrereq", query = "SELECT r FROM Requirimiento r WHERE r.nombrereq = :nombrereq")})
public class Requirimiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrequirimiento")
    private Integer idrequirimiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombrereq")
    private String nombrereq;
    @OneToMany(mappedBy = "idrequirimiento")
    private List<Solicitud> solicitudList;

    public Requirimiento() {
    }

    public Requirimiento(Integer idrequirimiento) {
        this.idrequirimiento = idrequirimiento;
    }

    public Requirimiento(Integer idrequirimiento, String nombrereq) {
        this.idrequirimiento = idrequirimiento;
        this.nombrereq = nombrereq;
    }

    public Integer getIdrequirimiento() {
        return idrequirimiento;
    }

    public void setIdrequirimiento(Integer idrequirimiento) {
        this.idrequirimiento = idrequirimiento;
    }

    public String getNombrereq() {
        return nombrereq;
    }

    public void setNombrereq(String nombrereq) {
        this.nombrereq = nombrereq;
    }

    @XmlTransient
    public List<Solicitud> getSolicitudList() {
        return solicitudList;
    }

    public void setSolicitudList(List<Solicitud> solicitudList) {
        this.solicitudList = solicitudList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrequirimiento != null ? idrequirimiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requirimiento)) {
            return false;
        }
        Requirimiento other = (Requirimiento) object;
        if ((this.idrequirimiento == null && other.idrequirimiento != null) || (this.idrequirimiento != null && !this.idrequirimiento.equals(other.idrequirimiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requirimiento[ idrequirimiento=" + idrequirimiento + " ]";
    }
    
}
