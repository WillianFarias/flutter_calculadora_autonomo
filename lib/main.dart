import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Scaffold utilizado para criar tela, caso a quantidade de elementos
    //estrapolar o tamanho da tela sera criado uma barra de rolagem
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento de autônomo"),
      ),
    );
  }
}
