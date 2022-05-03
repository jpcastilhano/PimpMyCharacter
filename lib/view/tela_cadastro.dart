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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      botao('Voltar', 't2'),
                      botao('Cadastrar', 't2'),
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
}
