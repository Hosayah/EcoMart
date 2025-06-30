import 'package:app_links/app_links.dart';
import 'package:ecomart/common/widgets/success_screen/success_screen.dart';
import 'package:ecomart/datas/repositories/authentication/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../datas/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../models/user_model.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final _client = Supabase.instance.client.auth;
  final deviceStorage = GetStorage();
  late final AppLinks _appLinks;
  StreamSubscription? _linkSub;
  bool _timerStarted = false;

  Timer? _timer;

  get userRepository => null;

  @override
  void onInit() {
    super.onInit();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() async {
    _appLinks = AppLinks();

    _linkSub = _appLinks.uriLinkStream.listen((uri) {
      print('Received deep link: $uri');

      if (uri.toString().startsWith('myapp://auth-callback')) {
        _client.getSessionFromUrl(uri); // Supabase handles session here

        if (!_timerStarted) {
          setTimeForVerification();
          _timerStarted = true;
        }
      }
    });
  }

  void setTimeForVerification() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      await _client.refreshSession();
      final userResponse = await _client.getUser();
      final user = userResponse.user;

      if (user != null && user.emailConfirmedAt != null) {
        final userData = deviceStorage.read('user');
        if (userData != null) {
          final newUser = UserModel.fromJson(userData);
          final userRepository = Get.put(UserRepository());
          await userRepository.insertUser(newUser.toJson());
          deviceStorage.remove('user');
        }

        timer.cancel();
        _timerStarted = false;
        Get.off(() => SuccessScreen(
          image: TImages.successfullyRegistrationAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: AuthenticationRepository.instance.screenRedirect(user),
        ));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _linkSub?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    final userResponse = await _client.getUser();
    final user = userResponse.user;

    if (user != null && user.emailConfirmedAt != null) {
      Get.off(() => SuccessScreen(image: TImages.successfullyRegistrationAnimation, title: TTexts.yourAccountCreatedTitle, subtitle: TTexts.yourAccountCreatedSubTitle, onPressed: AuthenticationRepository.instance.screenRedirect(user)));
    }
  }

}