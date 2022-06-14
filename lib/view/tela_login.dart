import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //Atributos necessários para mexer com os textos de Nome, Email e Senha
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  //Atributo para identificar unicamente o formulário da UI
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Layout do Login
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
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
                  const SizedBox(height: 10),
                  campoTexto('Email', txtEmail, false),
                  const SizedBox(height: 10),
                  campoTexto('Senha', txtSenha, true),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      botao('Cadastro', 't3'),
                      SizedBox(
                        width: 150,
                        height: 80,
                        //Tipos de botões
                        //  ElevatedButton
                        //  TextButton
                        //  OutlinedButton
                        child: ElevatedButton(
                          //comportamento
                          onPressed: () {
                            login(txtEmail.text, txtSenha.text);
                          },
                          //aparência
                          child: Text(
                            'Login',
                            style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade500,
                          ),
                        ),
                      ),
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

  campoTexto(rotulo, variavel, obscuro) {
    return TextFormField(
      //Associar a variável de controle
      controller: variavel,
      //Aparência
      style: const TextStyle(
          fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
      //Teclado numérico
      keyboardType: TextInputType.text,
      //Senha
      obscureText: obscuro,
      //Quant. máxima de caracteres
      maxLength: 30,
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

  caixaDialogo(title, msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            msg,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: const Text('Fechar')),
          ],
        );
      },
    );
  }

  login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      caixaDialogo('Sucesso', 'Usuário logado com sucesso!');

      Navigator.pushReplacementNamed(context, 't4');
    }).catchError((e) {
      //print('LOGIN ERRO: ' + e.code.toString());

      switch (e.code) {
        case 'invalid-email':
          caixaDialogo('Erro', 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          caixaDialogo('Erro', 'Usuário ou senha inválidos.');
          break;
        case 'wrong-password':
          caixaDialogo('Erro', 'Usuário ou senha inválidos.');
          break;
        default:
          caixaDialogo('Erro', 'Não foi possivel realizar o login.');
      }
    });
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
          Navigator.pushNamed(
            context,
            dir,
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
