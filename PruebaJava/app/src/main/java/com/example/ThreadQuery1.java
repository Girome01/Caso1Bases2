package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ThreadQuery1 extends Thread{
    String nombre;
    String canton;

    public ThreadQuery1(String _nombre, String _Canton){
        nombre = _nombre;
        canton = _Canton;
    }

    public void run (){
        System.out.println("\n");
        long inicio = System.currentTimeMillis();
		
		//Conexion a la base de datos
        String url = "jdbc:sqlserver://GIROME\\MSSQLSERVER2;databasename=Caso1BasesII;Max Pool Size=3;";
        String username = "PruebaBases2";
        String password = "1234";

        try{
            Connection connection = DriverManager.getConnection(url, username, password); //Conexion por JDBC
            System.out.println("Connect to SQL");

            connection.setAutoCommit(false);
            Statement stmt = connection.createStatement();
			
			// Llamada al Store Procedure para obtener los cantones
            System.out.println( stmt.executeQuery("EXEC CantonEntregable " + canton) );
            
        } catch(SQLException e){
            System.out.println("Oops, error");
            e.printStackTrace();
        }

        long fin = System.currentTimeMillis();
        System.out.println( (fin-inicio) +" milisegundos");
    }
}
