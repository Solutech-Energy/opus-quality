var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        momento,
                        FORMAT(momento, 'HH:mm:ss') as momento_grafico
                    from medida
                    where fk_aquario = ${idAquario}
                    order by idRegistro desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {

        instrucaoSql = `select registros.valor as Temperatura , registros.dataHora, 
        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
        from registros join sensores on registros.fkSensores = Sensores.idSensores 
        where tipo = 'temperatura';
        order by id desc limit ${limite_linhas};

        select registros.valor as Temperatura , registros.dataHora, 
        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
        from registros join sensores on registros.fkSensores = Sensores.idSensores 
        where tipo = 'luminosidade';`;


    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idAquario} 
                    order by idRegistro desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        valor as temperatura,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fkSensores
                        from Registros where fkSensores = 1 
                    order by idRegistro desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosSetor(idSetor) {
    instrucaoSql = `select 
                       *
                    from setor
                    where idSetor = ${idSetor}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosQuadrante(id) {
    instrucaoSql = `select s.tipo, s.quadrante, r.valor, r.dataHora from sensor s join registro r on s.idSensor = r.fkSensor where s.fkSetor = ${id} order by r.dataHora desc;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarSetores(id) {
    instrucaoSql = `select * from setor where fkEmpresa = ${id};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarDadosSetor,
    buscarDadosQuadrante,
    buscarSetores
}
