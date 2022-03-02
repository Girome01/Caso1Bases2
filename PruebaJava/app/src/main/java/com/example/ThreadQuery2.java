package com.example;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ThreadQuery2 extends Thread{
	//Instruccion inline
    String instruccion = "SELECT porPartidos.nombre Partido, can.nombre Canton, COUNT(contar.Total) Entregas  FROM dbo.Cantones can "+
    "INNER JOIN dbo.Deliverables dev ON dev.idCanton = can.idCanton "+
    "INNER JOIN ( "+
        "SELECT COUNT(dev.idDeliverable) Total, can.idCanton Canton "+
        "FROM dbo.Deliverables dev "+
        "INNER JOIN dbo.Cantones can ON can.idCanton = dev.idCanton "+
        "INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan "+
        "GROUP BY can.idCanton, plans.idPartido "+
    ") as contar ON contar.Canton = dev.idCanton "+
    "INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan "+
    "INNER JOIN ( "+
        "select TOP(25)PERCENT par.nombre, par.idPartido "+
        "FROM dbo.Partidos par "+
    ") as porPartidos ON porPartidos.idPartido = plans.idPartido "+
    "GROUP BY porPartidos.nombre, can.nombre ";
    String nombre;
    Connection con;

    public ThreadQuery2(String _nombre,Connection _con){
        nombre = _nombre;
        con = _con;
    }

    public void run (){
        System.out.println("\n");
        long inicio = System.currentTimeMillis();

        

        try{
			// Ejecucion del query inline
            Statement stmt = con.createStatement();
            System.out.println( stmt.executeQuery(instruccion) );
            
        } catch(SQLException e){
            System.out.println("Oops, error");
            e.printStackTrace();
        }

        long fin = System.currentTimeMillis();
        System.out.println( (fin-inicio) +" milisegundos");
    }
}
