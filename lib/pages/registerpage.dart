import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:exma/component/button.dart';
import 'package:exma/component/textfields.dart';

class Registerpage extends StatefulWidget {
  final Function()? onTap;
  const Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final pwconfirmationController = TextEditingController();

  void signuserup() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (pwController.text == pwconfirmationController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: pwController.text,
      );
      } 
      else {
        Navigator.pop(context);
        errormesagepop('Password is not the same');
        
      }
      // sign in successfull
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      errormesagepop(e.code);
    }
  }

  // wrong email pop up message
  void errormesagepop(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 185, 174, 187),
            title: Center(
                child: Text(message,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 245, 243, 243),
                        fontSize: 16))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 228, 236, 226),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // logo
                    Image.asset(
                      'lib/assets/images/pockerChesslogo.png',
                      width: 150,
                    ),

                    const Divider(
                      height: 25,
                      thickness: 2,
                      color: Color.fromARGB(31, 14, 12, 12),
                    ),

                    // Message
                    const Text(
                      'POKER CHESS',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),

                    const Divider(
                      height: 25,
                      thickness: 2,
                      color: Color.fromARGB(31, 14, 12, 12),
                    ),

                    const Text('Sign up here',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        )),
                    const Divider(
                      height: 25,
                      indent: 80,
                      endIndent: 80,
                      thickness: 2,
                      color: Color.fromARGB(31, 14, 12, 12),
                    ),

                    // Signup mail

                    MyTextfields(
                      controller: emailController,
                      hintText: 'email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 25),
                    // Signup password
                    MyTextfields(
                      controller: pwController,
                      hintText: 'password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 25),
                    // Signup confirmation password
                    MyTextfields(
                      controller: pwconfirmationController,
                      hintText: 'confirm password',
                      obscureText: true,
                    ),

          

                   

                    const SizedBox(height: 25),

                    // signin button
                    MyButton(onTap: signuserup, text:'Sign up'),

                    const Divider(
                      indent: 80,
                      endIndent: 80,
                      thickness: 2,
                      color: Color.fromARGB(31, 14, 12, 12),
                    ),
                    // text for sign in using :
                    const Text(
                      'Sign in using : ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                    ),
                    // signin using gmail or appleid
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            onPressed: null,
                            iconSize: 25,
                            icon:
                                ImageIcon(AssetImage('lib/assets/images/google.png'))),
                        IconButton(
                            onPressed: null,
                            iconSize: 25,
                            icon: ImageIcon(AssetImage('lib/assets/images/apple.png')))
                      ],
                    ),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Already registred, Sign in here',
                        selectionColor: Colors.grey.shade200,
                      ),
                    ),
                    //terms amd conditions popup

                    Text(
                      'terms and conditions',
                      selectionColor: Colors.grey.shade400,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
