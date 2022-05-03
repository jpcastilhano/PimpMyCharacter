import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TelaSobre extends StatefulWidget {
  const TelaSobre({Key? key}) : super(key: key);

  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  String about = 'Vazio';

  getData() async {
    String text;
    text = await rootBundle.loadString('assets/texts/Sobre.txt');
    setState(() {
      about = text;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre',
          style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade800,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      about,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image.asset(
                          'assets/images/jp.png',
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Image.asset(
                          'assets/images/peng.png',
                        ),
                      )
                    ],
                  ),
                  Row()
                ],
              )),
        ),
      ),
    );
  }
}
