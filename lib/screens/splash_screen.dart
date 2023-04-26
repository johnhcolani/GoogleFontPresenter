import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/background.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            colorOpacity: 0.9,
            child: Center(
              child: ScaleAnimatedWidget.tween(
                enabled: _enabled,
                duration: const Duration(milliseconds: 600),
                scaleDisabled: 0.3,
                scaleEnabled: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Center(
                    child: SizedBox(
                      height: 70.w,
                      width: 70.w,
                      child: Image.asset('assets/images/newLogo.png'),
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
