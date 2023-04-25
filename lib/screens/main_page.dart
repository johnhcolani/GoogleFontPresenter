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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         // SizedBox(height: 10.h,),
          Container(
            height: 5.h,
              child: Image.asset('assets/images/Google_Fonts_logo.svg.png')),

         // SizedBox(height: 1.h,),
          Text('Presentation\nfor\nfellow Flutter Developer',
            textAlign: TextAlign.center, style: GoogleFonts.genos(
                fontSize: 24, fontWeight: FontWeight.bold
            ),),
         // SizedBox(height: 5.h,),
          SizedBox(
              height: 30.w,
              width: 30.w,
              child: Image.asset('assets/images/icons8-flutter-480.png')),
          Padding(
            padding: EdgeInsets.only(top: 8.h,left: 16.0, right: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllGoogleFontsList()));

                },
                child:  Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 12.0),
                  child: Text('SHOW FONTS', style: TextStyle(
                      fontSize: 10.sp, fontWeight: FontWeight.normal),),
                )),
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
