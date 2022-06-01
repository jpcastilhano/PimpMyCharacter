import 'package:dnd/widgets/mensagens.dart';
import 'package:flutter/material.dart';

class TelaPersonagemDetalhes extends StatefulWidget {
  const TelaPersonagemDetalhes({ Key? key }) : super(key: key);

  @override
  State<TelaPersonagemDetalhes> createState() => _TelaPersonagemDetalhesState();
}

class _TelaPersonagemDetalhesState extends State<TelaPersonagemDetalhes> {
  @override
  Widget build(BuildContext context) {
    
    //Layout
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          'Detalhes do Personagem',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),

      backgroundColor: Colors.grey.shade800,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [

                //Basic Info
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),                    
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red.shade600,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade600,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Nome: ', style: estiloDetalhes()),
                            SizedBox(width: 5),
                            Text('Nível: ', style: estiloDetalhes(),),
                            SizedBox(width: 5),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Classe: ', style: estiloDetalhes()),
                            SizedBox(width: 5),
                            Text('Raça: ', style: estiloDetalhes()),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    )
                  )
                ),


              ]
            ),
          ),
        ),
      ),
    );
  }
}