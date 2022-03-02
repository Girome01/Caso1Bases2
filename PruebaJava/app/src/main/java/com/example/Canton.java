package com.example;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Cantones")
public class Canton {

    @Id 
    @Column(name="idCanton")
    private long idCanton;

    @Column(name="nombre")
    private String nombre;

    @Column(name="idProvincia")
    private long idProvincia;
    
    public long getIdCanton() {
        return idCanton;
    }
    public long getIdProvincia() {
        return idProvincia;
    }
    public void setIdProvincia(long idProvincia) {
        this.idProvincia = idProvincia;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setIdCanton(long idCanton) {
        this.idCanton = idCanton;
    }
    
}
