import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasoline = TextEditingController();
  String _result = "";

  void _calculate() {
    double? priceAlcool = double.tryParse(_controllerAlcool.text);
    double? priceGasoline = double.tryParse(_controllerGasoline.text);
    if (priceAlcool == null || priceGasoline == null) {
      setState(() {
        _result =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if (priceAlcool / priceGasoline >= 0.7) {
        setState(() {
          _result = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _result = "Melhor abastecer com alcool";
        });
      }
    }
    _clearfields();
  }
  void _clearfields(){
    _controllerAlcool.text = "";
    _controllerGasoline.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Image.asset("images/logo.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Preço Alcool, ex: 1.50"),
                    keyboardType: TextInputType.number,
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Preço Gasolina, ex: 3.15"),
                    keyboardType: TextInputType.number,
                    controller: _controllerGasoline,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: _calculate,
                      padding: const EdgeInsets.all(15),
                      color: Colors.blue,
                      child: const Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      _result,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ])),
      ),
    );
  }
}
