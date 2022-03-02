package com.example;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public final class App {
    

    public static void main(String[] args) throws IOException, SQLException {

		// ------------------ QUERY 1 -----------------------------------
        System.out.println("***************************************** Query 1 *****************************************");
        String cantones[] = {"Desamparados", "Escazú", "Naranjo", "Atenas",
        "Paraíso", "Turrialba", "Sarapiquí", "Liberia", "Esparza", "Talamanca"};

        ArrayList<ThreadQuery1> threadArray1 = new ArrayList<ThreadQuery1>();
        for(int i = 0; i < 10; i++){
            ThreadQuery1 thread1 = new ThreadQuery1("Thread"+i, cantones[i]);
            threadArray1.add(thread1);
        }

        for(int i = 0; i < 10; i++ ){
            threadArray1.get(i).run();

        }

        // ------------------ QUERY 2 -----------------------------------
		System.out.println("***************************************** Query 2 *****************************************");
        String url = "jdbc:sqlserver://GIROME\\MSSQLSERVER2;databasename=Caso1BasesII;Max Pool Size=3;";
        String username = "PruebaBases2";
        String password = "1234";

        Connection connection = DriverManager.getConnection(url, username, password);

        connection.setAutoCommit(false);

        ArrayList<ThreadQuery2> threadArray2 = new ArrayList<ThreadQuery2>();
        for(int i = 0; i < 10; i++){
            ThreadQuery2 thread1 = new ThreadQuery2("Thread"+i, connection);
            threadArray2.add(thread1);
        }

        for(int i = 0; i < 10; i++ ){
            threadArray2.get(i).run();

        }

        // ------------------- QUERY 3 ----------------------------------------------------------------------------------------------------------------------------------------------------
        System.out.println("***************************************** Query 3 *****************************************");
        Cache<Object, Object> cache = Caffeine.newBuilder()
                    .maximumSize(15)
                    .build();
		ArrayList<ThreadQuery3> threadArray3 = new ArrayList<ThreadQuery3>();

        Configuration con = new Configuration().configure(new File("app/src/main/resource/hibernate.cfg.xml"));

        SessionFactory sf = con.buildSessionFactory();

        for(int i = 0; i < 10; i++){
            ThreadQuery3 thread1 = new ThreadQuery3("Thread"+i, sf, cache);
            threadArray3.add(thread1);
        }

        for(int i = 0; i < 10; i++ ){
            threadArray3.get(i).run();
        }
    }
}
