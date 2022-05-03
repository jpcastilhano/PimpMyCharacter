import 'package:flutter/material.dart';

class TelaAnotacoes extends StatefulWidget {
  const TelaAnotacoes({ Key? key }) : super(key: key);

  @override
  _TelaAnotacoesState createState() => _TelaAnotacoesState();
}

class _TelaAnotacoesState extends State<TelaAnotacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(
        title: const Text(
          'Anotações',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),

      body: Container(
        color: Colors.grey.shade800,
        child: Expanded(
          child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 32,
              maxLines: 32,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              ),
              style: TextStyle(color: Colors.grey.shade300, fontSize: 20, fontFamily: "Poppins"),
              autofocus: true,
          ),
        ),
      ),
    );
  }
}