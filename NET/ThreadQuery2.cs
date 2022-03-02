using System;
using System.Threading;
using Microsoft.Data.SqlClient;
using System.Diagnostics;
  
namespace ThreadP.Query2{
    public class ThreadQuery2{
        public void ThreadQuery(){
            try{
                TimeSpan stop;
                TimeSpan start = new TimeSpan(DateTime.Now.Ticks);

                var datasource = "GIROME\\MSSQLSERVER2";
                var database = "Caso1BasesII";
                var username = "PruebaBases2";
                var password = "1234";

                string connString = @"Data Source=" + datasource + ";Initial Catalog="
                            + database + ";Persist Security Info=True;User ID=" + username +
                            ";Password=" + password+";TrustServerCertificate=True;Pooling=true;Max Pool Size = 3; Min Pool Size = 1";

                //Crecion de la conexion con la base de datos 
                SqlConnection conn = new SqlConnection(connString);
                //Creacion del inline query
                SqlCommand command = new SqlCommand("SELECT porPartidos.nombre Partido, can.nombre Canton, COUNT(contar.Total) Entregas  FROM dbo.Cantones can "+
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
                                                    "GROUP BY porPartidos.nombre, can.nombre ", conn);
                conn.Open(); //Apertura de la conexion 
                //Ejecucion del inline query
                SqlDataReader dr = command.ExecuteReader();

                /*if (dr.HasRows){
                    while (dr.Read())
                    {
                        string partido = dr.GetString(0);
                        string canton = dr.GetString(1);
                        int entregables = dr.GetInt32(2);

                        //display retrieved record
                        Console.WriteLine("{0}\t{1}\t{2}", partido, canton, entregables);
                    }
                }
                else
                {
                    Console.WriteLine("No data found.");
                }*/
                dr.Close();
                conn.Close();//Cierre de la conexion 

                stop = new TimeSpan(DateTime.Now.Ticks);
                Console.WriteLine("Tiempo: "+stop.Subtract(start).TotalMilliseconds+" milisegundos");
            }
            catch (Exception e){
                Console.WriteLine("Error: " + e.Message);
            }
        }
    }
}