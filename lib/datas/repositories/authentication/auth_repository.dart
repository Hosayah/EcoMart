import 'package:ecomart/features/authentication/screens/login/login.dart';
import 'package:ecomart/nav_menu.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../utils/popups/loaders.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final SupabaseClient _client = Supabase.instance.client;

  @override
  void onReady () {
    FlutterNativeSplash.remove();
    screenRedirect(_client.auth.currentUser);

  }

  screenRedirect(User? user) async {
    await Future.delayed(Duration(milliseconds: 100));
    final email = _client.auth.currentUser?.email;
    if(user != null) {
      if(user.emailConfirmedAt != null) {
        Get.offAll(() => const NavMenu());
      } else {
        Get.to(() => VerifyEmailScreen(emailAddress: email.toString()));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ? Get.offAll(LoginScreen()) : Get.offAll(OnBoardingScreen());
    }
  }
  
  /// Email Authentication - Sign in
  Future<AuthResponse> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(email: email, password: password);
      return response;
    } on AuthException catch (e) {
      // 🔥 Catch Supabase-specific errors
      TLoaders.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
      rethrow;
    } catch (e) {
      // 🛑 Other unexpected errors
      TLoaders.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
      rethrow;
    }
  }

  /// Register
  Future<AuthResponse> registerWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _client.auth.signUp(email: email, password: password, emailRedirectTo: 'myapp://auth-callback',);
      return response;
    } on AuthException catch (e) {
      TLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: e.toString(),
      );
      rethrow;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: e.toString(),
      );
      rethrow;
    }
  }
  /// Logout
  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      Get.offAll(LoginScreen()); // or Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Logout Failed',
        message: e.toString(),
      );
    }
  }

}