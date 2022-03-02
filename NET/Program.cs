using System;
using System.Threading;
using Microsoft.Data.SqlClient;
using ThreadP.Query1;
using ThreadP.Query2;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.EntityFrameworkCore.InMemory;  

namespace HelloWorld
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Console.WriteLine("\n\nLa segunda Query esta comentada porque se ejecutan los hilos seguidos, costando saber a cual de las querys corresponden. \n\n");

            // ----------------------------------- QUERY 1 -----------------------------------------
            Console.WriteLine("**************************************** QUERY 1 ****************************************");
            string[] cantones = {"Desamparados", "Escazú", "Naranjo", "Atenas", "Paraíso", "Turrialba", "Sarapiquí", "Liberia", "Esparza", "Talamanca"};
            List<Thread> threadArray1 = new List<Thread>();

            for(int i = 0; i < 10; i+=1){
                ThreadQuery1 obj = new ThreadQuery1();
                int num = i;
                Thread thr = new Thread(() => obj.ThreadQuery(cantones[num]));
                threadArray1.Add(thr);
            }

            foreach(Thread aPart in threadArray1){
                aPart.Start();
            }*/
            
            //---------------------------------------- QUERY 2-----------------------------------------
            Console.WriteLine("**************************************** QUERY 2 ****************************************");
            
            List<Thread> threadArray2 = new List<Thread>();

            for(int i = 0; i < 10; i+=1){
                ThreadQuery2 obj = new ThreadQuery2();
                int num = i;
                Thread thr = new Thread(new ThreadStart(obj.ThreadQuery));
                threadArray2.Add(thr);
            }

            foreach(Thread aPart in threadArray2){
                aPart.Start();
            }
            
            

        }
    }
}
