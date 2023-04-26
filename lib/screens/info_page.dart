import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/web_view_stack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'google_font_page.dart';

class InfoPage extends StatefulWidget {

  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xEAB7C5CE),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xCB182F3D),
        title: const Text('GoogleFont Application info',style: TextStyle(color: Colors.white60),),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 3.h),
        color: const Color(0xCB182F3D),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GoogleFont Application\nPreview Fonts for Your Flutter App',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Welcome to the GoogleFont Application, a handy tool designed specifically for Flutter developers! If you\'re looking for an easy way to preview Google Fonts in your Flutter app before actually using them, you\'ve come to the right place. Our application allows you to browse and experiment with various fonts to find the perfect one for your app\'s design.',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'How to Use',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xCB053F6E),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Using the GoogleFont Application is simple and straightforward. Just follow these steps:',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '1. Install the GoogleFont Package:',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 16.0,
                  color: const Color(0xCB053F6E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'To use Google Fonts in your Flutter app, you need to install the google_fonts package. You can do this by adding the following line to your pubspec.yaml file:',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                color: Colors.black87,
                child: Text(
                  'dependencies:\n  google_fonts: ^2.1.0',
                  style: GoogleFonts.adventPro(
                    fontSize: 14.0,
                    color: Colors.green
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '2. Import the Package:',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                    color: const Color(0xCB053F6E),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Import the google_fonts package in your Dart file where you want to use the fonts:',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,

                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black87,
                width: double.infinity,
                child: Text(
                  'import \'package:google_fonts/google_fonts.dart\';',
                  style: GoogleFonts.adventPro(
                    fontSize: 14.0,
                      color: Colors.green
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              Text(
                'Font Application provides a user-friendly interface to browse and preview fonts. You can search for fonts by name or filter them based on various criteria such as popularity, category, and language.',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '3. Use the Font in Your Flutter App:',
                style: GoogleFonts.merriweatherSans(
                  fontWeight: FontWeight.bold,
                    color: const Color(0xCB053F6E),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Once you have chosen a font, you can easily use it in your Flutter app. Just pass the selected font family as a parameter to the TextStyle widget from the google_fonts package. For example:',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                color: Colors.black87,
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Text(\'Hello\', style: GoogleFonts.yourSelectedFontStyle(fontSize: 18.0))',
                  style: GoogleFonts.adventPro(
                    fontSize: 14.0,
                      color: Colors.green
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '4. Buy Me a Coffee:',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                    color: const Color(0xCB053F6E),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'If you find the GoogleFont Application helpful in your Flutter development journey, consider buying me a coffee to support further development and maintenance of the app. Your support is greatly appreciated!',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.only(top: 4.h,left: 16.0, right: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xCB182F3D),),

                  ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewApp()));

                    },
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0,bottom: 12.0),
                        child: Text(
                          'Buy Me a Coffee',
                          style: GoogleFonts.adventPro(
                            fontSize: 18.0,color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    )),


            ],
          ),
        ),
      ),
    );
  }
}
