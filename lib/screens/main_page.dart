import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/background.dart';
import 'package:googl_font_presentation/screens/google_font_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Uri _url =
      Uri.parse('https://www.linkedin.com/in/john-colani-828626218/');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press here
        Navigator.pop(context);
        return false;
      },
      child: Stack(
        children: [
          const Background(),
          Scaffold(
            backgroundColor: Colors.blue.withOpacity(0.4),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 13.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox(height: 10.h,),
                  Container(
                      height: 5.h,
                      child: Image.asset(
                          'assets/images/Google_Fonts_logo.svg.png')),

                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'Presentation\nfor\nfellow Flutter Developer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.genos(
                        fontSize: 20.sp, fontWeight: FontWeight.bold,color: const Color(
                        0xf5182f3d)),
                  ),
                  // SizedBox(height: 5.h,),
                  SizedBox(
                      height: 30.w,
                      width: 30.w,
                      child:
                          Opacity(
                              opacity: 0.4,child: Image.asset('assets/images/icons8-flutter-480.png'))),
                  Padding(
                    padding: EdgeInsets.only(top: 38.h, left: 4.w, right: 4.w),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(
                            0xCB182F3D))
                      ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllGoogleFontsList()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: Text(
                            'SHOW FONTS',
                            style: TextStyle(color: Colors.white,
                                fontSize: 12.sp, fontWeight: FontWeight.normal),
                          ),
                        )),
                  ),

                  TextButton(
                      onPressed: () {
                        _launchUrl();
                      },
                      child: Text(
                        'John Colani',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,color: Colors.blue.shade100),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
