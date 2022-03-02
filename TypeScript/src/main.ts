let message : string = 'Hello World';
console.log(message);

const sql = require('mssql');

console.log("********************************* Query 1 *********************************");

async function query1 (canton: any){
    try {
        console.log("\n\n");
        
        let pool = await sql.connect('Server=GIROME\\MSSQLSERVER2;Database=Caso1BasesII;User Id=PruebaBases2;Password=1234;TrustServerCertificate=True;Pooling=true;Encrypt=true');
        let data = await pool.request().input('can', sql.VarChar, canton).query("EXEC CantonEntregable @can");
        for (let i=0;i<data.rowsAffected;i++){
            console.log(data.recordset[i]);
        }
       
       pool.close();

    } catch (err) {
        console.log('No salio bien' + err);
    }
}

let cantones: string[] = ["Desamparados", "Escazú", "Naranjo", "Atenas","Paraíso", "Turrialba", "Sarapiquí", "Liberia", "Esparza", "Talamanca"];
for (let i in cantones) {
    query1 (cantones[i]);
}

console.log("********************************* Query 2 *********************************");

async function query2 (){
    console.log("\n\n");
    var instruccion = "SELECT porPartidos.nombre Partido, can.nombre Canton, COUNT(contar.Total) Entregas  FROM dbo.Cantones can "+
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
    try {

        let pool = await sql.connect('Server=GIROME\\MSSQLSERVER2;Database=Caso1BasesII;User Id=PruebaBases2;Password=1234;TrustServerCertificate=True;Pooling=true;Encrypt=true');
        let data = await pool.request().query(instruccion);
        for (let i=0;i<data.rowsAffected;i++){
            console.log(data.recordset[i]);
        }
       
       pool.close();

    } catch (err) {
        console.log('No salio bien' + err);
    }
}

for (let i in cantones) {
    query2 ();
}

