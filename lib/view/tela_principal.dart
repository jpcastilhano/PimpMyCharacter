import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  var personagens;
  var nomeUsuario;

  @override
  void initState() {
    super.initState();
    //Recuperar os dados da coleção de caffes
    personagens = FirebaseFirestore.instance.collection('cafes').where('uid',
        isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString());
  }

  retornarNomeUsuario() async {
    var uid = FirebaseAuth.instance.currentUser!.uid.toString();
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then((q) {
      if (q.docs.isNotEmpty) {
        nomeUsuario = q.docs[0].data()['nome'];
      } else {
        nomeUsuario = 'NENHUM';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PimpMyCharacters',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.black87,
                Colors.red.shade900,
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/logoPng.png',
                        width: 180,
                        height: 137,
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Lista de Personagens, Rolador, Anotações, Sobre, Logout
            customDrawerList(
                Icons.android_outlined, ' Lista de Personagens', 't4'),
            customDrawerList(Icons.casino_outlined, ' Rolador de Dados', 't5'),
            customDrawerList(Icons.auto_awesome, ' Poções', 't10'),
            customDrawerList(Icons.description_outlined, ' Anotações', 't6'),
            customDrawerList(Icons.dashboard_outlined, ' Sobre', 't7'),
            customDrawerList(Icons.logout_outlined, ' Sair', 't2'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red.shade700,
        onPressed: () {
          Navigator.pushNamed(context, 't8');
        },
      ),
      body: Container(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: const Text('Nome personagem',
                              style: TextStyle(
                                  fontFamily: 'Raleway', fontSize: 18)),
                          subtitle: const Text('Classe Nível',
                              style: TextStyle(
                                  fontFamily: 'Raleway', fontSize: 18)),
                          onTap: () {},
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customDrawerList extends StatelessWidget {
  //Função que altera os itens da drawer

  IconData icon;
  String text;
  String dir;

  customDrawerList(this.icon, this.text, this.dir);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Colors.red.shade700,
        onTap: () {
          Navigator.pushNamed(context, dir);
        },
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  Text(text,
                      style:
                          const TextStyle(fontSize: 16, fontFamily: 'Poppins')),
                ],
              ),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
