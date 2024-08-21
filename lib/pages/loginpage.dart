import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exma/component/button.dart';
import 'package:exma/component/textfields.dart';
import 'package:exma/services/auth_services.dart';

class Loginpage extends StatefulWidget {


  final Function()? onTap;
   const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();

void _showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _hideLoadingDialog() {
    Navigator.pop(context);
  }

 void signuserin() async {
    
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try { 
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: pwController.text,
      );
      // sign in successfull
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        wrongemailpop(e.code);
      }
    }
  // wrong email pop up message
    void wrongemailpop(String message) {
      showDialog(
        context: context,
        builder:(context) {
        return  AlertDialog( 
          backgroundColor: const Color.fromARGB(255, 185, 174, 187),
          title: Center(
            child: Text(message,  style: const TextStyle(color: Color.fromARGB(255, 245, 243, 243), fontSize: 16))
            )
          );
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
                
                    const Text('Sign in',
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
                
                    // Signin mail textfield
                
                    MyTextfields(
                      controller: emailController,
                      hintText: 'email',
                      obscureText: false,
                    ),
                
                    const SizedBox(height: 25),
                    // Signin password
                    MyTextfields(
                      controller: pwController,
                      hintText: 'password',
                      obscureText: true,
                    ),
                    // forgeot password small button
                
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot password',
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                
                    const SizedBox(height: 25),
                
                    // signin button
                    MyButton(
                      onTap: signuserin,
                      text: 'Sign in'
                       ),
                
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
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                           onPressed: () async {
                            _showLoadingDialog();
                            UserCredential? userCredential;
                            try {
                             
                              userCredential =
                                  await AuthServices().signInWithGoogle();
                            } catch (e) {
                              // ignore: avoid_print
                              print('Error during Google Sign-In: $e');
                            } finally {
                              _hideLoadingDialog();
                            }

                            if (userCredential != null) {
                              // Proceed to the next screen or show a success message
                              log(
                                  'Signed in with Google: ${userCredential.user?.email}');
                            } else {
                              // Show error message
                              wrongemailpop(
                                  'Google Sign-In failed. Please try again.');
                            }
                          },
                          iconSize: 25,
                          icon: const ImageIcon(
                              AssetImage('lib/assets/images/google.png')),
                        ),
                        const IconButton(
                            onPressed: null,
                            iconSize: 25,
                            icon: ImageIcon(AssetImage('lib/assets/images/apple.png')))
                      ],
                    ),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Not registered, Sign up here',
                        selectionColor: Colors.grey.shade200,
                      ),
                    ),
                    //terms amd conditions popup
                    const Divider(
                      indent: 80,
                      endIndent: 80,
                      thickness: 2,
                      color: Color.fromARGB(31, 14, 12, 12),
                    ),
                    Text(
                      'terms and conditions',
                      selectionColor: Colors.grey.shade200,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

