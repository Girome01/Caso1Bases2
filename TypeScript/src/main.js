"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
let message = 'Hello World';
console.log(message);
const sql = require('mssql');
console.log("********************************* Query 1 *********************************");
function query1(canton) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log("\n\n");
            let pool = yield sql.connect('Server=GIROME\\MSSQLSERVER2;Database=Caso1BasesII;User Id=PruebaBases2;Password=1234;TrustServerCertificate=True;Pooling=true;Encrypt=true');
            let data = yield pool.request().input('can', sql.VarChar, canton).query("EXEC CantonEntregable @can");
            for (let i = 0; i < data.rowsAffected; i++) {
                console.log(data.recordset[i]);
            }
            pool.close();
        }
        catch (err) {
            console.log('No salio bien' + err);
        }
    });
}
let cantones = ["Desamparados", "Escazú", "Naranjo", "Atenas", "Paraíso", "Turrialba", "Sarapiquí", "Liberia", "Esparza", "Talamanca"];
for (let i in cantones) {
    query1(cantones[i]);
}
console.log("********************************* Query 2 *********************************");
function query2() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("\n\n");
        var instruccion = "SELECT porPartidos.nombre Partido, can.nombre Canton, COUNT(contar.Total) Entregas  FROM dbo.Cantones can " +
            "INNER JOIN dbo.Deliverables dev ON dev.idCanton = can.idCanton " +
            "INNER JOIN ( " +
            "SELECT COUNT(dev.idDeliverable) Total, can.idCanton Canton " +
            "FROM dbo.Deliverables dev " +
            "INNER JOIN dbo.Cantones can ON can.idCanton = dev.idCanton " +
            "INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan " +
            "GROUP BY can.idCanton, plans.idPartido " +
            ") as contar ON contar.Canton = dev.idCanton " +
            "INNER JOIN dbo.planes plans ON plans.idPlan = dev.idPlan " +
            "INNER JOIN ( " +
            "select TOP(25)PERCENT par.nombre, par.idPartido " +
            "FROM dbo.Partidos par " +
            ") as porPartidos ON porPartidos.idPartido = plans.idPartido " +
            "GROUP BY porPartidos.nombre, can.nombre ";
        try {
            let pool = yield sql.connect('Server=GIROME\\MSSQLSERVER2;Database=Caso1BasesII;User Id=PruebaBases2;Password=1234;TrustServerCertificate=True;Pooling=true;Encrypt=true');
            let data = yield pool.request().query(instruccion);
            for (let i = 0; i < data.rowsAffected; i++) {
                console.log(data.recordset[i]);
            }
            pool.close();
        }
        catch (err) {
            console.log('No salio bien' + err);
        }
    });
}
for (let i in cantones) {
    query2();
}
