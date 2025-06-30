import 'package:ecomart/supabase_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'datas/repositories/authentication/auth_repository.dart';

Future<void> main() async {
  /// Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Init Local Storage
  await GetStorage.init();

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Init Supabase
  await initSupabase().then((_) {
    Get.put(AuthenticationRepository());
  });

  runApp(const MyApp());
}

