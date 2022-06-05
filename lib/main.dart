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
      ),
    );
  }
}
