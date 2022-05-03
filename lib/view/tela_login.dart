import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //Atributos necessários para mexer com os textos de Nome, Email e Senha

  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  //Atributo para identificar unicamente o formulário da UI
  var form = GlobalKey<FormState>();

  String? nome;
  String? email;
  String? senha;
  @override
  Widget build(BuildContext context) {
    //Layout do Login
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            //Formulário
            child: Form(
              key: form,
              child: Column(
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 100,
                  ),
                  const Text(
                    //Flavour Text
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 30),
                  campoTexto('Nome', txtEmail, false, nome),
                  const SizedBox(height: 10),
                  campoTexto('Email', txtSenha, false, email),
                  const SizedBox(height: 10),
                  campoTexto('Senha', txtSenha, true, senha),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      botao('Cadastro', 't3', nome),
                      botao('Login', 't4', nome),
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

  campoTexto(rotulo, variavel, obscuro, value) {
    return TextFormField(
      //Associar a variável de controle
      controller: variavel,
      style: const TextStyle(
          fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
      keyboardType: TextInputType.text,
      obscureText: obscuro,
      //Quant. máxima de caracteres
      maxLength: 30,
      onChanged: (text) {
        value = text;
      },
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
            fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
        //hintText: 'Informe um valor numérico',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  botao(rotulo, dir, value) {
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
          Navigator.pushNamed(
            context,
            dir,
            arguments: {"name": value},
          );
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
