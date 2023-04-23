import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AllGoogleFontsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> allFonts = GoogleFonts.asMap().keys.toList(); // Get all available font families

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Google Fonts'),
      ),
      body: ListView.builder(
        itemCount: allFonts.length,
        itemBuilder: (context, index) {
          String fontFamily = allFonts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey.shade200,
              elevation: 1,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Google Family',textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(fontFamily,fontSize: 16.sp), // Apply font dynamically
                    ),
                    Text(
                      fontFamily,textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(fontFamily,fontSize: 24.sp), // Apply font dynamically
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
