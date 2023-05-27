var express = require("express");
var router = express.Router();
var path = require("path");

router.get("/", function (req, res) {
    res.render("index", { title: "Express" });
});

router.get("/dashboard", function (req, res) {
    res.sendFile(path.join(__dirname + '../../../public/dashboard/dashGeral.html'));
});

router.get("/dashboard/setor", function (req, res) {
    res.sendFile(path.join(__dirname + '../../../public/dashboard/DashboardEspecifica.html'));
});

module.exports = router;