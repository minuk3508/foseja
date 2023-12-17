import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isAuth => user != null;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signInWithGoogle() async {
    await _firebaseAuth.signInWithProvider(GoogleAuthProvider());
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

final authRepo = Provider((ref) => AuthRepo());
final authState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChanges();
});
