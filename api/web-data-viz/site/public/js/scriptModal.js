btnLogin = document.getElementById("btnLogin");
btnCloseModal = document.getElementById("btnCloseModal");
containerMain = document.getElementById("containerMain").style;
btnRegisterLink = document.getElementById("registerNavLink");
btnHaveAccount = document.getElementById("haveAccount");
registerNavLink = document.getElementById("registerNavLink");


btnLogin.addEventListener("click", function () {
    abrirLogin();
});



btnRegisterLink.addEventListener("click", () => {
    console.log("Listener ativado");
    toggleLogin();
})


btnHaveAccount.addEventListener("click", () => {
    toggleLogin();
})
btnCloseModal.addEventListener("click", function () {
    toggleModal();
});

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
    if (modalRegister.style.display == "none" || modalRegister.style.display == "" || modalLogin.style.display == "flex") {
        toggleLogin();
    }
    //toggleModal();
};
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

toggleModal();



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

