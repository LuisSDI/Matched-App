import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/request_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class SearchUserTab extends StatefulWidget {
  SearchUserTab({Key key,}) : super(key: key);
  @override
  _SearchUserTabState createState() => _SearchUserTabState();
}

class _SearchUserTabState extends State<SearchUserTab> {
  TextEditingController myController = TextEditingController();
  String searchValue = "";

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
    myController.addListener(_changeSearchVal);
    searchValue = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  _changeSearchVal() {
    setState(() {
      searchValue = myController.text;
    });
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
          Container(
            margin: EdgeInsets.symmetric(vertical:scaler.getWidth(2),
            horizontal: scaler.getWidth(1)),
            decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor,
                  width: 3
                ),
                color: white,

                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              maxLength: 30,
              textAlign: TextAlign.left,
              controller: myController,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal:scaler.getWidth(.5),
                vertical: scaler.getWidth(.5)),
                errorStyle: TextStyle(height: 0),
                hintText: 'Please enter a username',
                focusedErrorBorder: InputBorder.none,
                hintStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18,
                    )),
                counterText: '',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height / 2.8,
              child: StreamBuilder(
                  stream: userBloc.searchUser(searchValue),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    print(snapshot.connectionState);
                    print(snapshot.data.docs.isEmpty);
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if(snapshot.data.docs.isEmpty && searchValue != '')
                    {
                      return Padding(
                        padding:  EdgeInsets.all(scaler.getWidth(1)),
                        child: Center(
                          child: Text("There is no user named '$searchValue'",
                            style: GoogleFonts.lato(
                                fontSize: 22,
                                color: white,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,),
                        ),
                      );
                    }
                    else if(snapshot.data.docs.isEmpty){
                      return FutureBuilder(
                          future: userBloc.getListUsers(userBloc.currentUser.uid),
                          builder: (context, snapshot2) {
                            print(snapshot2.data);
                            if (snapshot2.connectionState == ConnectionState.done) {
                              List<UserModel> users = snapshot2.data;
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: scaler.getHeight(2),
                                            vertical: scaler.getHeight(.5),
                                          ),
                                          child: RequestButton(user: users[index],currentUserUid: userBloc.currentUser.uid,)
                                        );
                                      },
                                      itemCount: users.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return  Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(mainColor),
                                  ),
                              );
                            }
                          });
                    }
                    else{
                    return ListView(
                      children: snapshot.data.docs.map((document) {
                        UserModel user = UserModel(
                            name: document.get('full name'),
                            type: document.get('type'),
                            personality: document.get('personality'),
                            gender: document.get('gender'),
                            description: document.get('description'),
                            uid: document.get('uid'),
                            photoUrL: document.get('photoURL'),
                            email: document.get('email'),
                            groups: document.get('groups'));
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: scaler.getHeight(2),
                            vertical: scaler.getHeight(.5),
                          ),
                          child: RequestButton(user: user,currentUserUid: userBloc.currentUser.uid,),
                        );
                      }).toList(),
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
