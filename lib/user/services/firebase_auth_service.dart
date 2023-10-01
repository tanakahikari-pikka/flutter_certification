import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  /// サインイン
  /// TODO: サービス利用ユーザ情報更新
  Future<void> signIn() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      if (userCredential.user == null) {
        throw Exception();
      }
      final String uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection("users").doc(uid).set(
        {
          "id": uid,
          "createdAt": Timestamp.now(),
        },
      );
    }
  }

  /// サインアウト
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
