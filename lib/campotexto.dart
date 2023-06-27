import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => CampoTextoState();
}

class CampoTextoState extends State<CampoTexto> {

  TextEditingController controllerAlcool = TextEditingController();
  TextEditingController controllerGasolina =  TextEditingController();
  String textoResultado = '';

  void calcular(){
      var precoAlcool = double.tryParse(controllerAlcool.text);
      var precogasolina = double.tryParse(controllerGasolina.text);

      if (precoAlcool == null || precogasolina == null){
        setState(() {
          textoResultado = 'Não foi possivel calcular';
        });
      }else{
        if(precoAlcool / precogasolina >= 0.7){
          setState(() {
            textoResultado = 'melhor Abastecer com gasolina';
          });
        }else{
          setState(() {
            textoResultado = 'melhor Abastecer com alcool';
          });
        }

        limparCampos();

      }
  }

  void limparCampos(){
    controllerAlcool.text = '';
    controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: const Text('Entrada de dados'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Image.asset('images/carro.png'),
          Padding(padding: EdgeInsets.only(left: 0, top: 25, right: 0, bottom: 0),
            child: Text('Saiba qual a melhor opção para abastecer seu veículo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20, bottom: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o preço da alcool',
              ),
              enabled: true,
              maxLength: 5,
              controller: controllerAlcool,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o preço do gasolina'
              ),
              enabled: true,
              maxLength: 5,
              controller: controllerGasolina,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 25,
                )
              ),
              onPressed: calcular,
              child: const Text('Calcular'),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
              child: Text(textoResultado, 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) 
        ]),
        )
      ),
    );
  }
}