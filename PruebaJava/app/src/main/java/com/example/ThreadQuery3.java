package com.example;

import java.io.IOException;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.github.benmanes.caffeine.cache.Cache;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ThreadQuery3 extends Thread {
    public String nombre;
    private SessionFactory sf;
    private Cache<Object, Object> cache;
    private List list;

    
    public ThreadQuery3(String _nombre, SessionFactory _sf, Cache<Object, Object> _cache) throws IOException {
        nombre = _nombre;
        sf = _sf;
        cache = _cache;
    }

    public void run (){
        System.out.println("\n");
        try {
            Thread.sleep(50);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long inicio = System.currentTimeMillis();
		
		// Se crea la conexion
        Session session = sf.openSession();
		
		// Se verifica que el objeto este en la cache por medio de una key unica para el hilo
        Object value = cache.getIfPresent(nombre);
        if(value == null){
			//Si el objeto no esta en la cache 
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			
			// Se crea un query por medio del objeto Query3, para que por medio de hibernate se busque el objeto en la base
            CriteriaQuery<Query3> criteriaQuery = criteriaBuilder.createQuery(Query3.class);  
            Root<Query3> from = criteriaQuery.from(Query3.class);
            CriteriaQuery<Query3> select = criteriaQuery.select(from);

            TypedQuery<Query3> typedQuery = session.createQuery(select); // Ejecuta el query para buscar el objeto
            list = typedQuery.getResultList(); // S eguardan los objetos en una lista de hibernate
            
        }
        session.close();// se cierra la conexion
        
        long fin = System.currentTimeMillis();
        System.out.println( (fin-inicio) +" milisegundos");  

        /*for (Iterator iterator = list.iterator(); iterator.hasNext();){
            obtenerCanton obCanton = (obtenerCanton) iterator.next(); 
            System.out.print("Partido: " + obCanton.getPartido());
            System.out.print("  Canton: " + obCanton.getCanton()); 
            System.out.print("  Entregables: " + obCanton.getEntregables());
            System.out.println("\n");
        }*/    
    }

    
}
