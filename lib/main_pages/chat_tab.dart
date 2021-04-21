import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

import 'apply_tab.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    // User firebaseUser = FirebaseAuth.instance.currentUser;
    // UserBloc userBloc = BlocProvider.of(context);
    final Future<String> _dummy = Future<String>.delayed(
      const Duration(seconds: 2),
          () => 'Data Loaded',
    );
    return FutureBuilder(
        future: _dummy,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.done) {
            //List<UserApp> users = snapshot.data;
            //print(users);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: scaler.getWidth(7), top: scaler.getWidth(7)),
                    child: Container(
                      height: scaler.getHeight(5),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Chats,",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 36,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scaler.getHeight(1)),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: scaler.getHeight(2),
                            vertical: scaler.getHeight(.5),
                          ),
                          child: Container(
                            color: mainColor,
                          )
                        );
                      },
                      itemCount: 8,
                      //users.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
