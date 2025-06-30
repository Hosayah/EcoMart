import 'package:ecomart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecomart/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings/general_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lighTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primaryColor, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }
}