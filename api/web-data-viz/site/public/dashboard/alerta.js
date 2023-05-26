var alertas = [];

function obterdados(idAquario) {
    fetch(`/medidas/tempo-real/${idAquario}`)
        .then(resposta => {

            if (resposta.ok) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idAquario);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function alertar(resposta, idAquario) {
    var temp = resposta[0].temperatura;
    var lumi = resposta[0].temperatura;

    console.log(idAquario === resposta[0].fk_aquario)
    
    var grauDeAviso ='';


    var limitesTemperatura = {
        muito_frio: 20,
        frio: 22,
        ideal: 24,
        quente: 26,
        muito_quente: 27
    };

    var limitesLuminosidade = {
        sem_iluminacao: 500,
        baixa_iluminacao: 530,
        ideal: 987,
        alta_iluminacao: 1000,
        critica_ilumincao: 1001
    };

    var classe_temperatura = 'cor-alerta';

    if (temp <= limitesTemperatura.muito_frio) {
        classe_temperatura = 'cor-alerta perigo-quente';
        grauDeAviso = 'perigo quente'
        grauDeAvisoCor = 'cor-alerta perigo-quente'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp > limitesTemperatura.muito_frio && temp <= limitesTemperatura.frio) {
        classe_temperatura = 'cor-alerta alerta-quente';
        grauDeAviso = 'alerta quente'
        grauDeAvisoCor = 'cor-alerta alerta-quente'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp > limitesTemperatura.frio && temp <= limitesTemperatura.ideal) {
        classe_temperatura = 'cor-alerta ideal';
        removerAlerta(idAquario);
    }
    else if (temp > limitesTemperatura.ideal && temp <= limitesTemperatura.muito_quente) {
        classe_temperatura = 'cor-alerta alerta-frio';
        grauDeAviso = 'alerta frio'
        grauDeAvisoCor = 'cor-alerta alerta-frio'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp >= limitesTemperatura.muito_quente) {
        classe_temperatura = 'cor-alerta perigo-frio';
        grauDeAviso = 'perigo frio'
        grauDeAvisoCor = 'cor-alerta perigo-frio'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }




    
    if (lumi <= limitesLuminosidade.sem_iluminacao) {
        classe_temperatura = 'cor-alerta perigo-quente';
        grauDeAviso = 'perigo quente'
        grauDeAvisoCor = 'cor-alerta perigo-quente'
        exibirAlerta(lumi, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (lumi > limitesLuminosidade.sem_iluminacao && lumi <= limitesLuminosidade.baixa_iluminacao) {
        classe_temperatura = 'cor-alerta alerta-quente';
        grauDeAviso = 'alerta quente'
        grauDeAvisoCor = 'cor-alerta alerta-quente'
        exibirAlerta(lumi, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (lumi > limitesLuminosidade.baixa_iluminacao && lumi > limitesLuminosidade.ideal) {
        classe_temperatura = 'cor-alerta ideal';
        removerAlerta(idAquario);
    }
    else if (lumi > limitesLuminosidade.ideal && lumi <= limitesLuminosidade.alta_iluminacao) {
        classe_temperatura = 'cor-alerta alerta-frio';
        grauDeAviso = 'alerta frio'
        grauDeAvisoCor = 'cor-alerta alerta-frio'
        exibirAlerta(lumi, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (lumi > limitesLuminosidade.critica_ilumincao) {
        classe_temperatura = 'cor-alerta perigo-frio';
        grauDeAviso = 'perigo frio'
        grauDeAvisoCor = 'cor-alerta perigo-frio'
        exibirAlerta(lumi, idAquario, grauDeAviso, grauDeAvisoCor)
    }




    var card;

    if (idAquario == 1) {
        temp_aquario_1.innerHTML = temp + "°C";
        card = card_1
    } else if (idAquario == 2) {
        temp_aquario_2.innerHTML = temp + "°C";
        card = card_2
    } else if (idAquario == 3) {
        temp_aquario_3.innerHTML = temp + "°C";
        card = card_3
    } else if (idAquario == 4) {
        temp_aquario_4.innerHTML = temp + "°C";
        card = card_4
    }

    card.className = classe_temperatura;
}

function exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor) {
    var indice = alertas.findIndex(item => item.idAquario == idAquario);

    if (indice >= 0) {
        alertas[indice] = { idAquario, temp, grauDeAviso, grauDeAvisoCor }
    } else {
        alertas.push({ idAquario, temp, grauDeAviso, grauDeAvisoCor });
    }

    exibirCards();
    
// Dentro da div com classe grauDeAvisoCor há um caractere "invisível", 
// que pode ser inserido clicando com o seu teclado em alt+255 ou pelo código adicionado acima.
}

function removerAlerta(idAquario) {
    alertas = alertas.filter(item => item.idAquario != idAquario);
    exibirCards();
}
 
function exibirCards() {
    alerta.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        alerta.innerHTML += transformarEmDiv(mensagem);
    }
}

function transformarEmDiv({ idAquario, temp, grauDeAviso, grauDeAvisoCor }) {
    return `<div class="mensagem-alarme">
    <div class="informacao">
    <div class="${grauDeAvisoCor}">&#12644;</div> 
     <h3>Aquário ${idAquario} está em estado de ${grauDeAviso}!</h3>
    <small>Temperatura ${temp}.</small>   
    </div>
    <div class="alarme-sino"></div>
    </div>`;
}
