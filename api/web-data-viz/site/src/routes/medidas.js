var express = require("express");
var router = express.Router();
var path = require("path");
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

router.get("/dadosQuadrante/:setor/:quadrante", function (req, res) {
    medidaController.buscarDadosQuadrante(req, res);
})

router.get("/buscarSetores/:id", function (req, res) {
    medidaController.buscarSetores(req, res);
});

router.get("/setor/dadosQuadrante/", function (req, res) {
    res.sendFile(path.join(__dirname + '/src/v.html'));
});

module.exports = router;