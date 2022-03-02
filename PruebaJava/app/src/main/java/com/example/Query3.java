package com.example;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "obtenerCanton") //Se liga con la vista, la unica manera de que reconociera que es un objeto de la vista fue por medio de table
public class Query3 {
    
    @Id  // a fuerza se necesito un id para el mapping
    @GeneratedValue

    @Column(name="Partido")
    private String partido;

    @Column(name="Entregables")
    private int Entregables;

    @Column(name="Canton")
    private String canton;

    public String getPartido() {
        return partido;
    }

    public void setPartido(String partido) {
        this.partido = partido;
    }

    public int getEntregables() {
        return Entregables;
    }

    public void setEntregables(int entregables) {
        Entregables = entregables;
    }

    public String getCanton() {
        return canton;
    }

    public void setCanton(String canton) {
        this.canton = canton;
    }

    
}
