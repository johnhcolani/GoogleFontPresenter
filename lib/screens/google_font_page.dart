import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    List<String> filteredFonts =
        _filterFonts(_searchQuery); // Filtered font families

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              pinned: true,
              title: Text('Show Fonts'),
              backgroundColor: Colors.indigo,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    TextField(
                      onChanged: _onSearchQueryChanged,
                      decoration: InputDecoration(
                        labelText: ('Search Font'),
                        hintText: 'Search fonts...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.w),
                            borderSide: const BorderSide(color: Colors.indigo)),
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
                        color: Colors.indigo.shade50,
                        elevation: 1,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Google Family',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(fontFamily,
                                    fontSize: 16.sp),
                              ),
                              Text(
                                fontFamily,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(fontFamily,
                                    fontSize: 24.sp),
                              ),
                            ],
                          ),
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
        color: Colors.indigo,
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

    );
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
