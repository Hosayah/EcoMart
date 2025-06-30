import 'package:ecomart/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../datas/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final isAgree = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  Future<void> signup() async {
    try {
      // ✅ Start Loading
      FullScreenLoader.openLoadingDialog('Please Wait...', TImages.docerAnimation);

      // ✅ Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // ✅ Validate Form
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // ✅ Check Privacy Policy
      if (!isAgree.value) {
        FullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Accept Terms',
          message: 'You must accept the privacy policy to continue.',
        );
        return;
      }

      // ✅ Sign up with Supabase Auth (requires email verification)
      final authResponse = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final user = authResponse.user;
      if (user == null) {
        throw Exception('User registration failed — user is null.');
      }


      final userId = user.id;
      print(userId);

      // ✅ Create user model
      final newUser = UserModel(
        id: userId, // MUST match auth.uid() due to RLS
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // Save for insertion after verification
      final deviceStorage = GetStorage();
      deviceStorage.write('user', newUser.toJson());

      // ✅ Show success
      TLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Account created. Please verify your email.',
      );

      // ✅ Check if email is verified
      final isEmailVerified = user.emailConfirmedAt != null;
      print("Is email verified: $isEmailVerified");

      if (!isEmailVerified) {
        // ✅ Navigate to Verify Email screen
        Get.to(() => VerifyEmailScreen(emailAddress: email.text.trim()));
        return;
      }
      // ✅ Done - stop loader
      FullScreenLoader.stopLoading();

    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: e.toString(),
      );
    }
  }
}