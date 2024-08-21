import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthServices {
  // Sign the user in with Google
   Future<UserCredential?> signInWithGoogle() async {
    try {
    
      
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
   
        return null;
      }
       
       
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
     

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken,
        accessToken: gAuth.accessToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
     

      return userCredential;
    } catch (e) {
  
      return null;
    }
  }
}
