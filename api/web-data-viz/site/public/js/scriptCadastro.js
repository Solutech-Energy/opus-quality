async function cadastrar() {
    var nome = document.getElementById("inputNome").value;
    var email = document.getElementById("inputEmail").value;
    var senha = document.getElementById("inputSenha").value;
    var cpf = document.getElementById("inputCpf").value;
    var idEmpresa = document.getElementById("inputIdEmpresa").value;

    // aguardar();
    var body = {
        nome: nome,
        email: email,
        senha: senha,
        cpf: cpf,
        idEmpresa: idEmpresa
    }

    await fetch('usuarios/cadastrar', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(body)
    }).then(function (response) {
        console.log(response);
        if (response.ok) {
            alert("Cadastro realizado com sucesso!");
            return response.json();
        } else {
            alert("Erro ao cadastrar!");
            throw new Error("Erro ao cadastrar!");
        }
    }).then(function (data) {
        if (data) {
            console.log(data);
        } else {
        }
    }).catch(function (err) { });

}