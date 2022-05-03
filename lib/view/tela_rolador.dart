import 'dart:math';
import 'package:flutter/material.dart';

class TelaRolador extends StatefulWidget {
  const TelaRolador({Key? key}) : super(key: key);

  @override
  _TelaRoladorState createState() => _TelaRoladorState();
}

class _TelaRoladorState extends State<TelaRolador> {
  //Atributos necessários para mexer com os textos de Email e Senha
  var txtqtd = TextEditingController();
  var txtdado = TextEditingController();
  var txtmod = TextEditingController();
  //Atributo para identificar unicamente o formulário da UI
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rolador de Dados',
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
          padding: EdgeInsets.all(30),
          child: Center(
            //Formulário
            child: Form(
              key: form,
              child: Column(
                children: [
                  const Icon(
                    Icons.casino_outlined,
                    size: 100,
                  ),
                  const Text(
                    //Flavour Text
                    'Rolar dados',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 30),
                  campoTexto('Quantidade', txtqtd),
                  const SizedBox(height: 10),
                  campoTexto('Dado', txtdado),
                  const SizedBox(height: 10),
                  campoTexto('Modificador', txtmod),
                  botao('Calcular'),
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
      style: const TextStyle(
          fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
      keyboardType: TextInputType.number,
      //Quant. máxima de caracteres
      maxLength: 5,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
            fontSize: 24, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: 'Informe um valor numérico',
        hintStyle: const TextStyle(
            fontSize: 18, fontFamily: 'Raleway', fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  botao(rotulo) {
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
          //Validação dos campos do formulário
          if (form.currentState!.validate()) {
            //efetuar o cálculo do IMC
            setState(() {
              int qtd = int.parse(txtqtd.text);
              int dado = int.parse(txtdado.text);
              int mod = int.parse(txtmod.text);
              int resultado = (qtd * (Random().nextInt(dado) + 1)) + mod;
              caixaDialogo('O resultado da rolagem é $resultado.');
            });
          }
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

  caixaDialogo(msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text(
            msg,
            style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    txtqtd.clear();
                    txtdado.clear();
                    txtmod.clear();
                  });
                },
                child: const Text('Fechar')),
          ],
        );
      },
    );
  }
}
