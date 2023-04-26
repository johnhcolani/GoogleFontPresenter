import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/background.dart';
import 'package:googl_font_presentation/screens/info_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AllGoogleFontsList extends StatefulWidget {


  @override
  State<AllGoogleFontsList> createState() => _AllGoogleFontsListState();
}

class _AllGoogleFontsListState extends State<AllGoogleFontsList> {
  ScrollController _scrollController = ScrollController();
  String _searchQuery = ''; // Search query
  List<String> allFonts =
      GoogleFonts.asMap().keys.toList(); // List of all available font families
  Map<String, double> fontSizes = {};
  void _onSearchQueryChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<String> _filterFonts(String query) {
    // Filter font families based on search query
    query = query.toLowerCase();
    return allFonts
        .where((fontFamily) => fontFamily.toLowerCase().contains(query))
        .toList();
  }
  void _increaseFontSize(String fontFamily) {
    setState(() {
      if (fontSizes.containsKey(fontFamily)) {
        fontSizes[fontFamily] = fontSizes[fontFamily]! + 2.0;
      } else {
        fontSizes[fontFamily] = 24.0;
      }
    });
  }

  void _decreaseFontSize(String fontFamily) {
    setState(() {
      if (fontSizes.containsKey(fontFamily)) {
        fontSizes[fontFamily] = fontSizes[fontFamily]! - 2.0;
      } else {
        fontSizes[fontFamily] = 24.0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> filteredFonts =
        _filterFonts(_searchQuery); // Filtered font families

    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.blue.withOpacity(0.4),
        body: NestedScrollView(

          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(

                centerTitle: true,
                pinned: true,
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                title: Text('Show Fonts',style: TextStyle(color: Colors.white60),),
                 backgroundColor: Color(0xCB0A202D),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: _onSearchQueryChanged,

                        decoration: InputDecoration(

                          labelText: ('Search Font'),labelStyle: const TextStyle(color: Colors.white54),
                          hintText: 'Search fonts...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(25.w),
                              borderSide: const BorderSide(color: Colors.white)),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ];
          },
          body: Column(
            children: [
              Expanded(
                child: Scrollbar(
                  interactive: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredFonts.length,
                    itemBuilder: (context, index) {
                      String fontFamily = filteredFonts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(

                          color: Color(0x520A202D),
                          elevation: 1,
                          child: Row(
                            children: [

                              Expanded(
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _decreaseFontSize(fontFamily);
                                        },
                                        child: CircleAvatar(
                                          minRadius: 4.w,
                                          backgroundColor: const Color(0xFF2D3D49), // Set the desired background color for circular shape
                                          child: Icon(Icons.remove, size: 6.w,), // Set the icon to be displayed
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 8,bottom: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Builder(builder: (context) {
                                              // Use Builder to access context
                                              if (!fontSizes.containsKey(fontFamily)) {
                                                fontSizes[fontFamily] = 16.0;
                                              }
                                              return Text(
                                                'Google Family',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(fontFamily,
                                                    fontSize: fontSizes[fontFamily]!,
                                                color: const Color(0xFFE1AB37)),
                                              );
                                            }),
                                            Builder(builder: (context) {
                                              // Use Builder to access context
                                              if (!fontSizes.containsKey(fontFamily)) {
                                                fontSizes[fontFamily] = 24.0;
                                              }
                                              return Text(
                                                fontFamily,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(fontFamily,
                                                    fontSize: fontSizes[fontFamily]!,
                                                  color: Colors.white,
                                                )

                                              );
                                            }),

                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            _increaseFontSize(fontFamily);
                                          });
                                        },
                                        child: CircleAvatar(
                                          minRadius: 4.w,
                                          backgroundColor: const Color(
                                              0xCB182F3D), // Set the desired background color for circular shape
                                          child: Icon(Icons.add, size: 6.w,), // Set the icon to be displayed
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(

          padding: EdgeInsets.only(bottom: 2.h),
          color: const Color(
              0xCB122D3D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Total Fonts: ${allFonts.length}',textAlign:TextAlign.center,style: GoogleFonts.genos(
                  color: Colors.white,fontSize: 24.0),
                )),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: IconButton(
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoPage()));
                 },
                  icon: Icon(Icons.info_outline,size: 6.w,),color: Colors.white,),
              )
            ],
          ),
          ),

      ),
    ]);
  }
}
// Container(
// padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
// child: TextField(
// onChanged: (String value){
// allFonts.clear();
// if(value.isEmpty){
// allFonts.addAll(fonts);
// } else{
// fonts.forEach((element) {
// if(element['ABeeZee'].toString().toLowerCase().contains(value.toLowerCase())){
// allFonts.add(element);
// }
// });
// }
// setState(() {
//
// });
// },
// decoration: InputDecoration(
// hintText: 'Search',
// labelText: 'Search',
// prefixIcon: Icon(Icons.search),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(25),
// )
// ),
// ),
// ),
