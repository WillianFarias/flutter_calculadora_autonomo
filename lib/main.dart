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
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
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
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor bruto",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 51, 49, 47)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
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
                style: TextStyle(color: Colors.orangeAccent, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
