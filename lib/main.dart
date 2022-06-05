import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _informacao = "Digite os valores";
  TextEditingController taxaController = TextEditingController();
  TextEditingController valorBrutoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _limparFormulario() {
    taxaController.text = "";
    valorBrutoController.text = "";
    setState(() {
      _informacao = "Digite os valores";
      _formKey = GlobalKey<FormState>();
    });
  }

  _calcular() {
    setState(() {
      double taxa = double.parse(taxaController.text);
      double valorBruto = double.parse(valorBrutoController.text);
      double desconto = valorBruto * (taxa / 100.0);
      double valorLiquido = valorBruto - desconto;
      _informacao = "Valor bruto: ${valorBruto.toStringAsFixed(2)}\n" +
          "Desconto: ${desconto.toStringAsFixed(2)} \n " +
          "Valor líquido: ${valorLiquido.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold utilizado para criar tela, caso a quantidade de elementos
    //estrapolar o tamanho da tela sera criado uma barra de rolagem
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento de autônomo"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 136, 171),
        actions: [
          IconButton(
            onPressed: _limparFormulario,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Taxa",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
                controller: taxaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Valor da Taxa não estar em branco!";
                  }
                  try {
                    double.parse(value);
                  } catch (e) {
                    return "Valor inválido!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor Bruto",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
                controller: valorBrutoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Valor Bruto não estar em branco!";
                  }
                  try {
                    double.parse(value);
                  } catch (e) {
                    return "Valor Bruto inválido!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _calcular();
                    }
                  },
                  child: Text("Calcular"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 60, 136, 171),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Text(
                _informacao,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
