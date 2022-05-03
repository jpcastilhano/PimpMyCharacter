import 'package:flutter/material.dart';

class TelaLogo extends StatefulWidget {
  const TelaLogo({Key? key}) : super(key: key);

  @override
  State<TelaLogo> createState() => _TelaLogoState();
}

class _TelaLogoState extends State<TelaLogo> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushNamed(context, 't2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/images/logoPng.png'),
        ),
      ),
    );
  }
}
