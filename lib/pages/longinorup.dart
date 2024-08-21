import 'package:flutter/material.dart';
import 'package:exma/pages/loginpage.dart';
import 'package:exma/pages/registerpage.dart';

class Signinorup extends StatefulWidget {
  const Signinorup({super.key});

  @override
  State<Signinorup> createState() => _SigninorupState();
}

class _SigninorupState extends State<Signinorup> {
  //toggle between pages variable

  bool togglepages = true;

//toggle between pages variable
  void togglebp() {
    setState(() {
      togglepages = !togglepages;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (togglepages) {
      return Loginpage(
        onTap: togglebp,
      );
    } else {
      return Registerpage(
        onTap: togglebp,
      );
    }
  }
}
