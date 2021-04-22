import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/chat_tab.dart';
import 'package:matched_app/main_pages/discover_tab.dart';
import 'package:matched_app/main_pages/profile_tab.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/dorm_icon_icons.dart';
import 'package:matched_app/ui_resources/icons/fix_icons_icons.dart';
import 'apply_tab.dart';
import 'explore_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    ExploreTab(),
    DiscoverTab(),
    ChatTab(),
    ApplyTab(),
    ProfileTab(),
  ];
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    double paddingBottombar = scaler.getHeight(0.5);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: turkish),
        child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            iconSize: 18,
            backgroundColor: Colors.transparent,
            selectedLabelStyle: GoogleFonts.lato(
                textStyle:
                TextStyle(fontSize: 12, color: Colors.white)) ,
            items: [
              //Explore
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(paddingBottombar),
                    child: Icon(
                      DormIcon.noun_dormitory_2125386_1,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  label: "Explore",


                  backgroundColor: Colors.transparent),
              //Majors
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(paddingBottombar),
                    child: Icon(
                      FixIcons.mind_fix,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  label: "Personality",
                  backgroundColor: Colors.transparent),
              //Messages
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(paddingBottombar),
                    child: Icon(
                      Ionicons.ios_chatboxes,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  label: "Clubs",
                  backgroundColor: Colors.transparent),
              //Apply
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(paddingBottombar),
                    child: Icon(
                      AntDesign.form,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  label: "Matched!",
                  backgroundColor: Colors.transparent),
              //Profile
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(paddingBottombar),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  label:"Profile",
              )
            ]),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}