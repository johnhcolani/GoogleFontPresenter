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
                Text(
                'Google\nFonts',
                textAlign: TextAlign.center,
                style: GoogleFonts.asset(
                    fontSize: 30.sp, fontWeight: FontWeight.bold,color: const Color(
                    0xf5de9c0c),
                )
                ),
                  SizedBox(
                    height: 10.h,
                  ),



                  Text(
                    'Presentation\nfor\nfellow Flutter Developer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.genos(
                        fontSize: 20.sp, fontWeight: FontWeight.bold,color: const Color(
                        0xf5b8c7d0)),
                  ),
                   SizedBox(height: 2.h,),
                  SizedBox(
                      height: 40.w,
                      width: 30.w,
                      child:
                          Opacity(
                              opacity: 0.6,child: Image.asset('assets/images/icons8-flutter-480.png'))),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 4.w, right: 4.w),
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
                          setState(() {

                          });
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
                            fontWeight: FontWeight.bold,color: const Color(0xf5de9c0c)),
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
