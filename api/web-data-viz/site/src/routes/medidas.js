var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/dadosSetor/:id", function (req, res) {
    medidaController.buscarDadosSetor(req, res);
});

router.get("/dadosQuadrante/:id", function (req, res) {
    medidaController.buscarDadosQuadrante(req, res);
})

module.exports = router;