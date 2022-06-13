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
                            Text('Nível: ', style: estiloDetalhes(),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Row(
                          children: [
                            Text('Classe: ', style: estiloDetalhes()),
                            Text('Raça: ', style: estiloDetalhes()),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ],
                    )
                  )
                ),

                //Atributos
                Row( //Fisico
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Str: ', style: estiloDetalhes()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Dex: ', style: estiloDetalhes()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Con: ', style: estiloDetalhes()),
                      ),
                    ),
                    
                  ],
                ),

                Row( //Mental
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Int: ', style: estiloDetalhes()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Wis: ', style: estiloDetalhes()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Car: ', style: estiloDetalhes()),
                      ),
                    ),
                  ],
                ),

                //HP, CA, Iniciativa, Movimento, Proef., Percepção Passiva.
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
                            Text('HP: ', style: estiloDetalhes()),
                            Text('CA: ', style: estiloDetalhes(),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Row(
                          children: [
                            Text('Iniciativa: ', style: estiloDetalhes()),
                            Text('Movimento: ', style: estiloDetalhes()),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Row(
                          children: [
                            Text('Proeficiência: ', style: estiloDetalhes()),
                            Text('Percep. Passiva: ', style: estiloDetalhes()),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ],
                    )
                  )
                ),
                
                //Ataques
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10), 
                    decoration: boxDecorationDetalhes(),
                    child: Text('Ataque 1: ', style: estiloDetalhes()),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10), 
                    decoration: boxDecorationDetalhes(),
                    child: Text('Ataque 2: ', style: estiloDetalhes()),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10), 
                    decoration: boxDecorationDetalhes(),
                    child: Text('Ataque 3: ', style: estiloDetalhes()),
                  ),
                ),

                //Spells
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Spell DC: ', style: estiloDetalhes()),
                      )
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10), 
                        decoration: boxDecorationDetalhes(),
                        child: Text('Spell Bônus: ', style: estiloDetalhes()),
                      )
                    ),
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}