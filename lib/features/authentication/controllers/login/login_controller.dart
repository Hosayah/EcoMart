import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../datas/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final deviceStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    email.text = deviceStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = deviceStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    rememberMe.value = deviceStorage.read('REMEMBER_ME') ?? false;
  }

  /// Login
  Future<void> login() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog('Logging you in', TImages.docerAnimation);

      // Check Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if(!formKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data is remember me is checked
      if(rememberMe.value) {
        deviceStorage.write('REMEMBER_ME_EMAIL', email.text);
        deviceStorage.write('REMEMBER_ME_PASSWORD', password.text);
      }

      // Login user using email and password
      final userCredentials = await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Stop Loading
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect(userCredentials.user);
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}