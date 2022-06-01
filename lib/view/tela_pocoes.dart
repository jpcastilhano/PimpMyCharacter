import 'dart:math';
import 'package:flutter/material.dart';

class TelaPocoes extends StatefulWidget {
  const TelaPocoes({Key? key}) : super(key: key);

  @override
  _TelaPocoesState createState() => _TelaPocoesState();
}

class _TelaPocoesState extends State<TelaPocoes> {
  //Atributos necessários para mexer com os textos de Email e Senha
  //Atributo para identificar unicamente o formulário da UI
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Poções',
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
          padding: const EdgeInsets.all(30),
          child: Center(
            //Formulário
            child: Form(
              key: form,
              child: Column(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    size: 100,
                  ),
                  const Text(
                    //Flavour Text
                    'Criador de poções',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 30),
                  botao('Gerar Poção'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  botao(rotulo) {
    return SizedBox(
      width: 110,
      height: 80,
      //Tipos de botões
      //  ElevatedButton
      //  TextButton
      //  OutlinedButton
      child: ElevatedButton(
        //comportamento
        onPressed: () {
          switch (Random().nextInt(10) + 1) {
            case 1:
              caixaDialogo('Poção de Sangue Ácido',
                  'Beber esta poção dá ao seu sangue uma qualidade ácida por 1 hora. Durante esse tempo, sempre que você receber dano cortante ou perfurante de uma criatura a até 1,5m de você, essa criatura leva metade da quantidade de dano sofrido em dano ácido. A criatura pode fazer um teste de resistência de Destreza CD 14 para reduzir este dano à metade novamente. Enquanto o efeito da poção está ativo você também ganha resistência contra ácido. As manchas que flutuam neste líquido verde são visivelmente de escamas de dragão negro.');
              break;
            case 2:
              caixaDialogo('Poção de Adaptação de Dano',
                  'Depois de beber esta poção sua magia permanece adormecida em seu sistema até a próxima vez que você receber dano de um tipo específico. Você imediatamente ganha resistência a esse tipo de dano por 1 hora. Flocos de escamas de uma variedade de dragões podem ser vistos flutuando através do líquido translúcido da poção.');
              break;
            case 3:
              caixaDialogo('Poção de Cura Retardada',
                  'Beber esta poção não surte efeito imediato. Em vez disso, sua magia permanece adormecida em seu sistema até a primeira vez que seus pontos de vida caem abaixo da metade. Nesse momento role um número de d6 igual ao seu nível e recupere este valor de pontos de vida. Há um punhado de algo pequeno e vermelho profundamente dentro do líquido tipo melaço contido na garrafa.');
              break;
            case 4:
              caixaDialogo('Poção de Aura Ardente',
                  'Beber esta poção concede-lhe resistência a dano de gelo por 1 hora. Durante este tempo, sempre que você causar danos corpo a corpo todas as criaturas a até 1,5m de você tomam 1 ponto de dano de fogo. O líquido da poção é dividido entre uma porção clara que fica perto do topo e uma poção laranja e vermelha como uma nuvem que está constantemente turva no fundo da garrafa. A garrafa em si é quente apenas ao toque.');
              break;
            case 5:
              caixaDialogo('Poção de Aterramento',
                  'Beber esta poção concede-lhe uma resistência a danos do tipo relâmpago durante 1 hora. As criaturas próximas também ganham resistência aos danos causados pelo raio, desde que estejam a até 3 metros de você quando tomarem o dano. Uma haste de cobre flutua no centro do líquido de céu azulado contido nesta garrafa.');
              break;
            case 6:
              caixaDialogo('Poção de Aura Glacial',
                  'Beber esta poção concede-lhe resistência a danos do tipo fogo durante 1 hora. Durante este tempo, sempre que você causar dano do tipo corpo a corpo todas as criaturas a até 1,5m de você recebem 1 ponto de dano de gelo. O líquido da poção é dividido entre uma parcela turva que flutua perto do topo e uma parte clara que repousa sobre o fundo. Parece que está nevando dentro da garrafa e sua superfície é fria ao toque.');
              break;
            case 7:
              caixaDialogo('Poção de Luta Melhorada',
                  'Beber esta poção concede-lhe uma visão útil no calor da batalha. Você ganha um bônus de +1 em seus testes de ataque corpo a corpo e um bônus de +2 em seus testes de ataque ao fazer um ataque de oportunidade. Este efeito dura 1 hora. O flash ocasional causado por um choque pode ser discernido olhando profundamente dentro deste líquido obscuro.');
              break;
            case 8:
              caixaDialogo('Poção de Duplicação',
                  'Quando encontrada a magia desta poção será inerte. Se for colocada junto a outra garrafa contendo uma poção mágica e deixada em repouso durante 24 horas, a poção nesta garrafa assumirá as propriedades da poção ao lado, criando uma poção duplicada. Esta garrafa parece simplesmente conter água, no entanto o líquido brilha brilhantemente e desloca-se através de um espectro de cores quando agitado.');
              break;
            case 9:
              caixaDialogo('Poção de Sustentação',
                  'Depois de beber esta poção você pode ficar por 3 dias sem comida ou água, sem sofrer os efeitos nocivos. A magia da poção supre o equivalente a 450g de comida e um galão de água, que são os requisitos para cada um desses dias. O conteúdo desta garrafa assemelha-se a um guisado aquoso que está sendo constantemente agitado.');
              break;
            case 10:
              caixaDialogo('Poção de Encolher',
                  'Quando bebe esta poção, você ganha o efeito de “reduzir” da magia aumentar/reduzir por 1d4 horas (não requer concentração). O vermelho no líquido da poção se contrai constantemente em uma gota minúscula e então se expande para colorir o líquido transparente em volta dele. Sacudir a garrafa não interrompe este processo.');
              break;
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
}
