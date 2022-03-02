/*using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PORM
{
    public class CantonesContext : DbContext
    {
        public DbSet<Canton> Cantones { get; set; }

        public string DbPath { get; }

        public void BloggingContext()
        {
            var folder = Environment.SpecialFolder.LocalApplicationData;
            var path = Environment.GetFolderPath(folder);
            DbPath = System.IO.Path.Join(path, "blogging.db");
        }

        // The following configures EF to create a Sqlite database file in the
        // special "local" folder for your platform.
        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite($"Data Source={DbPath}");
    }

    public class Canton
    {
        public long idCanton  { get; set; }
        public string nombre { get; set; }
        public long idProvincia { get; set; }

    }
}*/