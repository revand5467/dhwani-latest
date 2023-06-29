import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dhwani/widgets/tile_widget.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../models/tile_model.dart';
import '../controller/bottom_bar.dart';
import 'package:dhwani/screens/bottom_bar.dart';
import 'package:dhwani/screens/speech_to_text.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
final Bottom controller = Get.put(Bottom());
TextToSpeech tts = TextToSpeech();

FlutterTts ftts = FlutterTts();

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchValue = '';
  // final List<String> _suggestions = [
  //   'Afeganistan',
  //   'Albania',
  //   'Algeria',
  //   'Australia',
  //   'Brazil',
  //   'German',
  //   'Madagascar',
  //   'Mozambique',
  //   'Portugal',
  //   'Zambia'
  // ];
  final List<String> _suggestions = demo
      .map(
        (e) => e.name,
        //    log(e.name),
      )
      .toList() as List<String>;

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  // (_suggestions);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Search',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
          appBar: EasySearchBar(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              title: const Text('Search'),
              onSearch: (value) => setState(() => searchValue = value),
              // actions: [
              //   IconButton(icon: const Icon(Icons.person), onPressed: () {})
              // ],
              asyncSuggestions: (value) async =>
                  await _fetchSuggestions(value)),
          // drawer: Drawer(
          //     child: ListView(padding: EdgeInsets.zero, children: [
          //   const DrawerHeader(
          //     decoration: BoxDecoration(
          //       color: Colors.blue,
          //     ),
          //     child: Text('Drawer Header'),
          //   ),
          //   ListTile(
          //       title: const Text('Item 1'),
          //       onTap: () => Navigator.pop(context)),
          //   ListTile(
          //       title: const Text('Item 2'),
          //       onTap: () => Navigator.pop(context))
          // ])),
          // print('$searchValue'),
          body: searchValue == ''
              ? Text('$searchValue')
              :
              //Text('$searchValue')
              Center(
                  widthFactor: 100,
                  heightFactor: double.infinity,
                  child: GestureDetector(
                    onTap: () async {
                      //your custom configuration
                      await ftts.setLanguage("en-US");
                      await ftts.setSpeechRate(0.25); //speed of speech
                      await ftts.setVolume(1.0); //volume of speech
                      await ftts.setPitch(1); //pitc of sound

                      //play text to sp
                      var result = await ftts.speak(demo
                          .where((element) => element.name == searchValue)
                          .first
                          .description);
                      if (result == 1) {
                        //speaking
                      } else {
                        //not speaking
                      }
                    },
                    child: Card(
                        child: Center(
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  demo
                                      .where((element) =>
                                          element.name == searchValue)
                                      .first
                                      .name),
                            ),
                          ),
                          SvgPicture.asset(
                            height: 200,
                            //width: 100,
                            demo
                                .where((element) => element.name == searchValue)
                                .first
                                .image,

                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                      onPressed: () {
                        Get.to(Example());
                      },
                    ),
                    GButton(
                      icon: LineIcons.book,
                      text: 'Likes',
                    ),
                    GButton(
                      onPressed: () {
                        Get.to(Search());
                      },
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: LineIcons.microphone,
                      text: 'Speak',
                      onPressed: () {
                        Get.to(Speech());
                      },
                    ),
                  ],
                  selectedIndex: controller.selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      //_selectedIndex = index;
                      controller.updateIndex(index);
                    });
                  },
                ),
              ),
            ),
          ),
          //            GridView.count(
          //       crossAxisCount: 2,
          //       // Future ind = demo.where((element) {
          //       //   return element.index where (element.name == value);});

          //       children:
          //        List.generate(4, (index) {
          //         return tileWidget(index);
          //       }
          //       ),
          //  )
        ));
  }
}
