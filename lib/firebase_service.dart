import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpUser(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Tambahkan data pengguna tambahan seperti username ke Firestore atau database lainnya, jika diperlukan
      print('User registered successfully: ${userCredential.user?.uid}');
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  getUserData() {}
}
