import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sizer/sizer.dart';


import 'main_page.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({Key? key,}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final bool _enabled = true;
  @override
  void initState() {
    super.initState();
    _handleSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
            backgroundColor: Colors.blue.withOpacity(0.4),
          body: Shimmer(
            colorOpacity: 0.2,
            child: Center(
              child: ScaleAnimatedWidget.tween(
                enabled: _enabled,
                duration: const Duration(milliseconds: 500),
                scaleDisabled: 0.2,
                scaleEnabled: 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Center(
                    child:
                    SizedBox(
                      height: 110.w,
                      width: 110.w,
                      child: Text(
                          'Google\nFonts',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.asset(
                            fontSize: 30.sp, fontWeight: FontWeight.bold,color: const Color(
                              0xf5de9c0c),
                          )
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          )),
   ]);
  }

  void _handleSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
