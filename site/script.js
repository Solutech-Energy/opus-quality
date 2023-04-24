btnLogin = document.getElementById("btnLogin");
btnCloseModal = document.getElementById("btnCloseModal");
containerMain = document.getElementById("containerMain").style;
btnRegisterLink = document.getElementById("RegisterLink");
btnHaveAccount = document.getElementById("haveAccount");
registerNavLink = document.getElementById("registerNavLink");

btnLogin.addEventListener("click", function () { abrirLogin() });

function toggleModal() {
    var modal = document.querySelector(".containerModal").style;
    var modalState = modal.display;

    if (modalState == "none") {
        containerMain.animation = "escurecerFundo 1s";
        containerMain.opacity = "0.1";
        containerMain.backgroundColor = "#000";
        containerMain.position = "fixed"
        modal.display = "flex";
    } else {
        containerMain.backgroundColor = "#5b6284";
        containerMain.animation = "clarearFundo 1s";
        modal.display = "none";
        containerMain.opacity = "1";
        containerMain.position = "relative";
    }
}

btnCloseModal.addEventListener("click", function () {
    toggleModal();
});


function cria_cookie(nome, valor) {
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

function apaga_cookie(nome) {
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
    //console.log("ultimoLogin: " + ultimoLogin);
    cookies = ultimoLogin.split('=')[1];
    console.log(cookies);
    if (cookies == undefined) {
        // alert("Você não está logado");
        toggleModal();
    } else {
        // alert("Você está logado");
    }
}



function login() {

    var login = document.getElementById("inputEmail").value;
    var senha = document.getElementById("inputSenha").value;
    var validacao =
        (login == "admin" && senha == "admin") ||
        (login == "user" && senha == "user") ||
        (login == "yan" && senha == "lindo");

    if (validacao) {
        cria_cookie("login", "true");
        toggleModal();
    } else {
        alert("Login ou senha inválidos");
    }
}

function logout() {
    apaga_cookie("login");
    verificarLogin();
}


verificarLogin();

function toggleLogin() {

    var modalRegister = document.getElementById("cardRegister");
    var modalRegisterState = modalRegister.style.display;
    var modalLogin = document.getElementById("cardLogin");

    if (modalRegisterState == "none" || modalRegisterState == "") {
        modalRegister.style.display = "block";
        modalLogin.style.display = "none";
    } else {
        modalRegister.style.display = "none";
        modalLogin.style.display = "flex";
    }
}

function abrirLogin() {
    var modalRegister = document.getElementById("cardRegister");
    toggleModal();
    if (modalRegister.style.display == "block") {
        toggleLogin();
    }
};

function abrirRegister() {
    var modalLogin = document.getElementById("cardLogin");
    var modalRegister = document.getElementById("cardRegister");
    toggleModal();
    if (modalRegister.style.display == "none" || modalRegister.style.display == "" || modalLogin.style.display == "flex") {
        toggleLogin();
    }
};

registerNavLink.addEventListener("click", function () {
    abrirRegister();
});


btnRegisterLink.addEventListener("click", () => {
    toggleLogin();
})

btnHaveAccount.addEventListener("click", () => {
    toggleLogin();
})
