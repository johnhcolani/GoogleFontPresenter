import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googl_font_presentation/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData myTheme = ThemeData(
      primarySwatch: Colors.grey, // Set the primary color for the app
      //accentColor: Colors.orange, // Set the accent color for the app
      // Add more color values as needed
    );
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: myTheme,
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        });
  }
}

