import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/requests_tab.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/results_tab.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/search_user_tab.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';


class HomeMatchScreen extends StatefulWidget {
  HomeMatchScreen(
      {Key key,
      @required this.title,
      @required this.identifier})
      : super(key: key);
  final String title, identifier;

  @override
  _HomeMatchScreenState createState() => _HomeMatchScreenState();
}

class _HomeMatchScreenState extends State<HomeMatchScreen> {
  String identifier;

  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: dark,
          appBar: AppBar(

            backgroundColor: mainColor,
            bottom: TabBar(
              labelStyle: GoogleFonts.lato(
                color: white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              indicatorColor: deepBlue,
              tabs: [
                Tab(
                  text: "Search",
                  icon: Icon(Icons.search,size: 36,),
                  iconMargin: EdgeInsets.symmetric(
                    vertical:scaler.getWidth(.5)
                  ),
                ),
                Tab(text: "Requests",
                  icon: Icon(Icons.insert_invitation,size: 36,),
                  iconMargin: EdgeInsets.symmetric(
                      vertical:scaler.getWidth(.5)
                  ),),
                Tab(text: "Results",
                  icon: Icon(Foundation.results,size: 36,),
                  iconMargin: EdgeInsets.symmetric(
                      vertical:scaler.getWidth(.5)
                  ),),
              ],
              labelColor: Colors.white,
            ),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Do we match?",
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
          ),
          body: TabBarView(
            children: [
              SearchUserTab(),
              RequestsTab(),
              ResultsTab(),

            ],
          ),
          // body: Center(

          //   //child: QuizzPage(),

          // ),
        ));
  }
}

// class MatchingScreen extends StatelessWidget {
//   const MatchingScreen(
//       {Key key, @required this.title, @required this.identifier})
//       : super(key: key);
//   final String title, identifier;
//
//   @override
//   Widget build(BuildContext context) {
//     UserBloc userBloc = BlocProvider.of(context);
//     User currentUser = userBloc.currentUser;
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   text: "search ",
//                   icon: Icon(Icons.search),
//                 ),
//                 Tab(text: "Results", icon: Icon(Icons.send)),
//                 Tab(text: "Requests", icon: Icon(Icons.insert_invitation)),
//               ],
//               labelColor: Colors.white,
//             ),
//             // Here we take the value from the MyHomePage object that was created by
//             // the App.build method, and use it to set our appbar title.
//             title: Text(title),
//           ),
//           body: TabBarView(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 1.2,
//                 child: ListUsers(identifier: currentUser.email),
//               ),
//               // Center(
//               //   child: QuizzPage(),
//               // ),
//               InvitationTab(gotInvitation: 1, identifier: currentUser.email),
//               InvitationTab(identifier: currentUser.email),
//             ],
//           ),
//           // body: Center(
//
//           //   //child: QuizzPage(),
//
//           // ),
//         ));
//   }
// }
