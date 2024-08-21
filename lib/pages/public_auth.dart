import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exma/pages/homepage.dart';
import 'package:exma/pages/longinorup.dart';

class PublicAuth extends StatelessWidget {
  
  const PublicAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user signed in
        if (snapshot.hasData) {
          
          return Homepage();
        }

        // user not signed in
        else {
          return const Signinorup();
        }
      },
    ));
  }
}
