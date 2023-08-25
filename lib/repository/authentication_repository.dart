import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app_flutter/repository/sign_up_email_and_password_exception.dart';
import 'package:login_app_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:login_app_flutter/screens/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => DashboardScreen());
    } on FirebaseAuthException catch (firebaseException) {
      final fireEx = SignUpEmailAndPasswordException(firebaseException.code);
      print('FIREBASE AUTH EXCEPTION - ${fireEx.message}');
      throw fireEx;
    }
    catch (exception) {
      const ex = SignUpEmailAndPasswordException();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (firebaseException) {
      print(firebaseException.code);
    }
    catch (exception) {
      print(exception);
    }
  }

  Future<void> logout() async => await _auth.signOut();
}