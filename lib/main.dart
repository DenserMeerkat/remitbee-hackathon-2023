import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon_app/screens/home.dart';
//import 'package:hackathon_app/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: AdaptiveTheme(
          light: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: const Color.fromARGB(255, 30, 44, 119),
          ),
          dark: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: const Color.fromARGB(255, 30, 44, 119),
          ),
          initial: savedThemeMode ?? AdaptiveThemeMode.dark,
          builder: (lightTheme, darkTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Hackathon App',
              theme: ThemeData(
                brightness: Brightness.light,
                colorSchemeSeed: const Color.fromARGB(255, 30, 44, 119),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorSchemeSeed: const Color.fromARGB(255, 30, 44, 119),
              ),
              themeMode: ThemeMode.system,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
