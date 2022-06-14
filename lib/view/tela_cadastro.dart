import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  //Atributos necessários para mexer com os textos de Email e Senha
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtCidade = TextEditingController();
  var txtEstado = TextEditingController();
  var txtDataNasc = TextEditingController();
  var txtCpf = TextEditingController();
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
                    Icons.person_add_outlined,
                    size: 100,
                  ),
                  const Text(
                    //Flavour Text
                    'Cadastro',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 30),
                  campoTexto('Nome', txtNome, false),
                  const SizedBox(height: 10),
                  campoTexto('Email', txtEmail, false),
                  const SizedBox(height: 10),
                  campoTexto('Senha', txtSenha, true),
                  const SizedBox(height: 10),
                  campoTexto('Cidade', txtCidade, false),
                  const SizedBox(height: 10),
                  campoTexto('Estado', txtEstado, false),
                  const SizedBox(height: 10),
                  campoTexto('CPF', txtCpf, false),
                  const SizedBox(height: 10),
                  campoTexto('Data de Nascimento', txtDataNasc, false),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      botao('Voltar', 't2'),
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
                            cadastrar(
                                txtNome.text, txtEmail.text, txtSenha.text,
                                txtCpf.text, txtDataNasc.text, txtCidade.text, txtEstado.text);
                          },
                          //aparência
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
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

  cadastrar(nome, email, senha, cpf, dtnasc, cidade, estado) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      //Armazenar o nome completo no Firestore
      //print('UID: ' + res.user!.uid.toString());
      FirebaseFirestore.instance.collection('usuarios').add(
        {
          'uid': res.user!.uid.toString(),
          'nome-completo': nome,
          'cpf': cpf,
          'data-nascimento': dtnasc,
          'cidade': cidade,
          'estado': estado,
        },
      );
      caixaDialogo('Sucesso', 'O usuário foi criado com sucesso!');
      Navigator.pushNamed(
        context,
        't2',
      );
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          caixaDialogo('Erro', 'Email já está sendo utilizado.');
          break;
        case 'invalid-email':
          caixaDialogo('Erro', 'O formato do email está errado.');
          break;
        default:
          caixaDialogo('Erro', 'Não foi possivel criar o usuário.');
      }
    });
  }
}
