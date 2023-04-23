import 'package:flutter/material.dart';
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
  final Uri _url = Uri.parse('https://www.linkedin.com/in/john-colani-828626218/');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // Handle back button press here
      Navigator.pop(context);
      return false;
    },
    child:Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10.h,),
          Text('Google Fonts\nPresentation\nfor\nfellow\nFlutter\nDeveloper',
            textAlign: TextAlign.center, style: GoogleFonts.aboreto(
                fontSize: 24, fontWeight: FontWeight.bold
            ),),
          SizedBox(height: 5.h,),
          SizedBox(
              height: 40.w,
              width: 40.w,
              child: Image.asset('assets/images/icons8-flutter-480.png')),
          Padding(
            padding: EdgeInsets.only(top: 20.h,left: 16.0, right: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllGoogleFontsList()));
//AllGoogleFontsList
                },
                child: const Text('START', style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),)),
          ),

          TextButton(
              onPressed: () {
                _launchUrl();
              }, child: const Text('John Colani',style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          ),))
        ],
      ),
    ));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
