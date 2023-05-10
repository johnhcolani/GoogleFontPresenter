import 'package:flutter/material.dart';
import 'package:googl_font_presentation/screens/background.dart';
import 'package:googl_font_presentation/screens/info_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class AllGoogleFontsList extends StatefulWidget {
  @override
  State<AllGoogleFontsList> createState() => _AllGoogleFontsListState();
}

class _AllGoogleFontsListState extends State<AllGoogleFontsList> {
  TextEditingController searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late SharedPreferences _prefs;

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
    double currentSize = fontSizes[fontFamily]!;
    double newSize = currentSize + 1.0.sp;
    double maxLimit = 24.0.sp;
    setState(() {
      if (newSize <= maxLimit) {
        fontSizes[fontFamily] = newSize;
      }
      _saveFontSize(fontFamily);
    });
  }

  void _decreaseFontSize(String fontFamily) {
    double currentSize = fontSizes[fontFamily]!;
    double newSize = currentSize - 1.0.sp;
    double minLimit = 8.0.sp;
    setState(() {
      if (newSize >= minLimit) {
        fontSizes[fontFamily] = newSize;
      }
      _saveFontSize(fontFamily);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPrefs();
    setState(() {});
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Load the saved font sizes from SharedPreferences
    allFonts.forEach((fontFamily) {
      double? fontSize = _prefs.getDouble(fontFamily);
      if (fontSize != null) {
        fontSizes[fontFamily] = fontSize;
      }
    });
  }

  void _saveFontSize(String fontFamily) {
    if (fontSizes.containsKey(fontFamily)) {
      double fontSize = fontSizes[fontFamily]!;
      _prefs.setDouble(fontFamily, fontSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredFonts =
        _filterFonts(_searchQuery); // Filtered font families

    return Stack(children: [
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
                title: Text(
                  'Show Fonts',
                  style: TextStyle(color: Colors.white60),
                ),
                backgroundColor: Color(0xCB0A202D),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          fontSize: 14.sp,color: Colors.white
                        ),
                        controller: searchController,
                        onChanged: _onSearchQueryChanged,
                        decoration: InputDecoration(

                          labelText: ('Search Font'),
                          fillColor: const Color(0xFFAB6666),
                          focusColor: Colors.white54,
                          labelStyle: const TextStyle(color: Colors.white54),
                          hintText: 'Search fonts...',
                          hintStyle: const TextStyle(color: Colors.white54),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                                _onSearchQueryChanged('');
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.w),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
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
                  thickness: 20,
                  interactive: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredFonts.length,
                    itemBuilder: (context, index) {
                      String fontFamily = filteredFonts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 8.0),
                        child: Card(
                          color: Color(0x520A202D),
                          elevation: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _decreaseFontSize(fontFamily);
                                          });
                                        },
                                        child: CircleAvatar(
                                          minRadius: 2.w,
                                          backgroundColor: const Color(
                                              0xFF2D3D49), // Set the desired background color for circular shape
                                          child: Icon(
                                            Icons.remove,
                                            size: 6.w,
                                          ), // Set the icon to be displayed
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Builder(builder: (context) {
                                              // Use Builder to access context
                                              if (!fontSizes
                                                  .containsKey(fontFamily)) {
                                                fontSizes[fontFamily] = 12.sp;
                                              }
                                              return Text(
                                                'Font Family',
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                                style: GoogleFonts.getFont(
                                                  fontFamily,
                                                  fontSize:
                                                      fontSizes[fontFamily]!,
                                                  color:
                                                      const Color(0xFFE1AB37),
                                                ),
                                              );
                                            }),
                                            Builder(builder: (context) {
                                              // Use Builder to access context
                                              if (!fontSizes
                                                  .containsKey(fontFamily)) {
                                                fontSizes[fontFamily] = 16.sp;
                                              }
                                              return Center(
                                                child: Text(fontFamily.replaceAll(' ','\n'),

                                                  textAlign: TextAlign.center,
                                                  softWrap: true,
                                                  style: GoogleFonts.getFont(
                                                    fontFamily,
                                                    fontSize: fontSizes[
                                                        fontFamily]!,
                                                    color: Colors.white,
                                                  ),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            setState(() {
                                              _increaseFontSize(fontFamily);
                                            });
                                          });
                                        },
                                        child: CircleAvatar(
                                          minRadius: 2.w,
                                          backgroundColor: const Color(
                                              0xCB182F3D), // Set the desired background color for circular shape
                                          child: Icon(
                                            Icons.add,
                                            size: 6.w,
                                          ), // Set the icon to be displayed
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
          color: const Color(0xCB0A202D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Total Fonts: ${allFonts.length}',
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.genos(color: Colors.white, fontSize: 24.0),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoPage()));
                  },
                  icon: Icon(
                    Icons.info_outline,
                    size: 6.w,
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
