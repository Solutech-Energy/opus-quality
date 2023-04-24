function cria_cookie() {
    var nome = "login";
    var valor = "true";
    // Cria uma data 01/01/2020
    var data = new Date(2026, 0, 01);
    // Converte a data para GMT
    data = data.toGMTString();
    // Codifica o valor do cookie para evitar problemas
    valor = encodeURI(valor);
    // Cria o novo cookie
    document.cookie = nome + '=' + valor + '; expires=' + data + '; path=/';
    console.log('Cookie criado: ' + nome + '=' + valor + '; expires=' + data + '; path=/');
}

function logout() {
    var nome = "login";
    // Cria uma data no passado 01/01/2010
    var data = new Date(2010, 0, 01);
    // Converte a data para GMT
    data = data.toGMTString();
    // Tenta modificar o valor do cookie para a data expirada
    // Assim ele será apagado
    document.cookie = nome + '=; expires=' + data + '; path=/';
    console.log('Cookie apagado: ' + nome + '=; expires=' + data + '; path=/');
}


function verificarLogin() {
    var ultimoLogin = document.cookie;
    cookies = ultimoLogin.split('=')[1];
    console.log(cookies);
    if (cookies == undefined) {
        abrirLogin();
    } else {
        // alert("Você está logado");
        alert("Usuário Autenticado com Sucesso!")
        window.location.assign("./dashboardGeral.html")

    }
}


function login() {

    var login = document.getElementById("inputEmail").value;
    var senha = document.getElementById("inputSenha").value;
    var validacao =
        (login == "admin" && senha == "admin") ||
        (login == "user" && senha == "user") ||
        (login == "yan" && senha == "lindo") ||
        (login == "Kat" && senha == 2712);

    if (validacao) {
        cria_cookie();
        toggleModal();
        alert("Usuário Autenticado com Sucesso!")
        window.location.assign("./dashboardGeral.html")
    } else {
        alert("Login ou senha inválidos");
    }
}

clickSave.addEventListener('click', function () {
    window.location.assign("https://api.whatsapp.com/send/?phone=5511974315565&text=Ol%C3%A1%21+Acabei+de+me+%2Acadastrar%2A+no+seu+Sistema%21&type=phone_number&app_absent=0")
})

function logout() {
    apaga_cookie("login");
    verificarLogin();
}

