import 'package:dnd/view/tela_personagemDetalhes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:dnd/view/tela_anotacoes.dart';
import 'package:dnd/view/tela_cadastro.dart';
import 'package:dnd/view/tela_login.dart';
import 'package:dnd/view/tela_logo.dart';
import 'package:dnd/view/tela_personagemCadastro.dart';
import 'package:dnd/view/tela_pocoes.dart';
import 'package:dnd/view/tela_principal.dart';
import 'package:dnd/view/tela_rolador.dart';
import 'package:dnd/view/tela_sobre.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PimpMyCharacter',
      initialRoute: 't1',
      routes: {
        't1': (context) => const TelaLogo(),
        't2': (context) => const TelaLogin(),
        't3': (context) => const TelaCadastro(),
        't4': (context) => const TelaPrincipal(), //Vulgo Lista de Personagens
        't5': (context) => const TelaRolador(), //Rolador de Dados
        't6': (context) => const TelaAnotacoes(),
        't7': (context) => const TelaSobre(),
        't8': (context) => const TelaPersonagemCadastro(), //Cadastro de personagem
        't9': (context) => const TelaPersonagemDetalhes(), //Detalhes do personagem
        't10': (context) => const TelaPocoes(),
      },
    ),
  );
}
