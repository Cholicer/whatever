import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/bindings/general_bindings.dart';
import 'package:whatever_app/navigator_menu.dart';
import 'package:whatever_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const NavigationMenu(),
    );
  }
}
