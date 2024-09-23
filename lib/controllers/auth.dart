import 'package:firebase_auth/firebase_auth.dart';

class Auth {
	Auth._();
	static FirebaseAuth _instance = FirebaseAuth.instance;

	static Future<String> login({ required String email, required String password }) async {
		try {
			final credential = await _instance.signInWithEmailAndPassword(
				email: email,
				password: password
			);
			return 'login-success';
		} on FirebaseAuthException catch(error) {
			return error.code;
		}
	}
}
