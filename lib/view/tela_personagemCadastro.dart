import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaPersonagemCadastro extends StatefulWidget {
  const TelaPersonagemCadastro({Key? key}) : super(key: key);

  @override
  State<TelaPersonagemCadastro> createState() => _TelaPersonagemCadastroState();
}

class _TelaPersonagemCadastroState extends State<TelaPersonagemCadastro> {
//Atributos necessários para mexer com os textos de Email e Senha
  var txtNome = TextEditingController();
  var txtClasse = TextEditingController();
  var txtRaca = TextEditingController();
  var txtNivel = TextEditingController();

  var txtHp = TextEditingController();
  var txtCa = TextEditingController();
  var txtIniciativa = TextEditingController();
  var txtMovimento = TextEditingController();
  var txtProeficiencia = TextEditingController();
  var txtPpassiva = TextEditingController();

  var txtStr = TextEditingController();
  var txtDex = TextEditingController();
  var txtCon = TextEditingController();
  var txtInt = TextEditingController();
  var txtWis = TextEditingController();
  var txtCha = TextEditingController();

  var txtAtk1 = TextEditingController();
  var txtAtk2 = TextEditingController();
  var txtAtk3 = TextEditingController();
  var txtSpellDc = TextEditingController();
  var txtSpellAtkBonus = TextEditingController();
  //Atributo para identificar unicamente o formulário da UI
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Layout
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Cadastro de Personagem',
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
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Form(
              key: form,
              child: Column(
                children: [
                  //Row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Coluna Atributos
                      Column(
                        children: [
                          SizedBox(
                            width: 55,
                            child: campoTexto('Str', txtStr),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 55,
                            child: campoTexto('Dex', txtDex),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 55,
                            child: campoTexto('Con', txtCon),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 55,
                            child: campoTexto('Int', txtInt),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 55,
                            child: campoTexto('Wis', txtWis),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 55,
                            child: campoTexto('Cha', txtCha),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),

                      //Coluna Principal
                      Column(
                        children: [
                          const Icon(
                            Icons.person_add_alt_outlined,
                            size: 100,
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              SizedBox(
                                width: 200,
                                child: campoTexto('Nome', txtNome),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 200,
                                child: campoTexto('Raça', txtRaca),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 200,
                                child: campoTexto('Classe', txtClasse),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            //HP, CA, Iniciativa, Movimento, Proef., Percepção Passiva. 2 Colunas com 3 cada
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: campoTexto('HP', txtHp),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 100,
                                    child: campoTexto('CA', txtCa),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 100,
                                    child:
                                        campoTexto('Iniciativa', txtIniciativa),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                              const SizedBox(width: 25),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child:
                                        campoTexto('Movimento', txtMovimento),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 150,
                                    child: campoTexto(
                                        'Proeficiência', txtProeficiencia),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 150,
                                    child: campoTexto(
                                        'Percepção Passiva', txtPpassiva),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  //Row 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Ataques e Spells
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: campoTexto('Ataque 1', txtAtk1),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 350,
                            child: campoTexto('Ataque 2', txtAtk2),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 350,
                            child: campoTexto('Ataque 3', txtAtk3),
                          ),
                          const SizedBox(height: 5),

                          //Spells
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 170,
                                child: campoTexto('Spell DC', txtSpellDc),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 170,
                                child:
                                    campoTexto('Spell Bônus', txtSpellAtkBonus),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  campoTexto(rotulo, variavel) {
    return TextFormField(
      //Associar a variável de controle
      controller: variavel,
      //Aparência
      style: const TextStyle(
          fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
      //Teclado numérico
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
            fontSize: 16, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //Cores
        fillColor: Colors.grey.shade300,
        filled: true,
        //Tirar a parte do hinttext de cima do field
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  botao(rotulo, dir) {
    return SizedBox(
      width: 150,
      height: 80,
      //Tipos de botões
      //  ElevatedButton
      //  TextButton
      //  OutlinedButton
      child: ElevatedButton(
        //comportamento
        onPressed: () {
          Navigator.pushNamed(context, dir);
        },
        //aparência
        child: Text(
          rotulo,
          style: const TextStyle(
              fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade500,
        ),
      ),
    );
  }
}
