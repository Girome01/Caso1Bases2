using System;
using System.Threading;
using Microsoft.Data.SqlClient;
  
namespace ThreadP.Query1{
    public class ThreadQuery1{
        public void ThreadQuery(string canton){
            try{
                TimeSpan stop;
                TimeSpan start = new TimeSpan(DateTime.Now.Ticks);
                // Conexion a la base de datos
                var datasource = "GIROME\\MSSQLSERVER2";
                var database = "Caso1BasesII";
                var username = "PruebaBases2";
                var password = "1234";

                string connString = @"Data Source=" + datasource + ";Initial Catalog="
                            + database + ";Persist Security Info=True;User ID=" + username +
                            ";Password=" + password+";TrustServerCertificate=True;Pooling=true";

                //Creacion de la llamada a la base de datos, con su conexion 
                SqlConnection conn = new SqlConnection(connString);
				//Ejecucion del Store Procedure 
                SqlCommand command = new SqlCommand("EXEC CantonEntregable "+canton, conn);
                conn.Open(); //habilitar la conexion 
				//Ejecucion del Store Procedure 
                SqlDataReader dr = command.ExecuteReader();

                /*if (dr.HasRows){
                    while (dr.Read())
                    {
                        string partido = dr.GetString(0);
                        string entregable = dr.GetString(1);

                        //display retrieved record
                        
                        Console.WriteLine("{0}\t{1}\t{2}", partido, entregable,canton);
                    }
                }
                else
                {
                    Console.WriteLine("No data found. "+canton);
                }*/
                dr.Close();
                conn.Close();// cierre de la conexion 

                stop = new TimeSpan(DateTime.Now.Ticks);
                Console.WriteLine("Tiempo: "+stop.Subtract(start).TotalMilliseconds+" milisegundos");
                Console.WriteLine("\n");
            }
            catch (Exception e){
                Console.WriteLine("Error: " + e.Message);
            }
        }
    }
}