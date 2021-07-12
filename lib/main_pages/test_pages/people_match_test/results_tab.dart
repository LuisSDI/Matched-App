import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/accept_request_button.dart';
import 'package:matched_app/resources/request_button.dart';
import 'package:matched_app/resources/result_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ResultsTab extends StatefulWidget {
  ResultsTab({
    Key key,
  }) : super(key: key);

  @override
  _ResultsTabState createState() => _ResultsTabState();
}

class _ResultsTabState extends State<ResultsTab> {
  TextEditingController myController = TextEditingController();
  String searchValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    ScreenScaler scaler = ScreenScaler()..init(context);
    return BlocProvider(
      bloc: userBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height / 2.8,
              child: FutureBuilder(
                  future: userBloc.getResults(userBloc.currentUser.uid),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<UserModel>> snapshot) {
                    print(snapshot.connectionState);
                    print(snapshot.data);
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: mainColor,
                        ),
                      );
                    } else if (snapshot.data == null) {
                      return Padding(
                        padding: EdgeInsets.all(scaler.getWidth(1)),
                        child: Center(
                          child: Text(
                            "You currently don't have any results from your requests",
                            style: GoogleFonts.lato(
                                fontSize: 22,
                                color: white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: scaler.getWidth(1)),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: scaler.getHeight(2),
                                vertical: scaler.getHeight(.5),
                              ),
                              child: ResultButton(
                                user: snapshot.data[index],
                                currentUserUid: userBloc.currentUser.uid,
                                testUid: snapshot.data[index].results.first,
                              ),
                            );
                          },
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
