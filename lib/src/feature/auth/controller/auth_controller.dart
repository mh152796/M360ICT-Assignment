import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m_360_assignment/src/core/routes/routes_name.dart';

class AuthController extends GetxController implements GetxService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  RxBool isObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;
  RxBool rememberMe = true.obs;

  Rxn<User?> currentUser = Rxn<User>();


  @override
  void onInit() {
    currentUser(_firebaseAuth.currentUser);
    super.onInit();
  }


  Future<void> googleSign() async {
    try {
      EasyLoading.show(status: "Please wait...");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final authCredential = await _firebaseAuth.signInWithCredential(
          credential,
        );
        if (authCredential.user != null) {
          currentUser(authCredential.user);
          Get.toNamed(RoutesName.dashboardScreen);
        }
        else{
          EasyLoading.showError("Some thing went wrong");
        }
      }
      else{
        EasyLoading.showError("Some thing went wrong");
      }
    } catch (e) {
      EasyLoading.showError("Some thing went wrong: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }


}