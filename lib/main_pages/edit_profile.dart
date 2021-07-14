
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

//import 'apply_tab.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;
  UserBloc userBloc;

  EditProfile({Key key,
    this.user
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name;
  String dropdownValue;
  String description;
  String countryField;
  String photoUrL;
  //Country country;
  final GlobalKey<ScaffoldState> _scaffkey = GlobalKey();
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    photoUrL ??= widget.user.photoUrL;
    dropdownValue ??= widget.user.type;
    //countryField ??= widget.user.country;
    //country = CountryPickerUtils.getCountryByName(countryField);

    return BlocProvider(
      bloc: UserBloc(),
      child: Scaffold(
        key: _scaffkey,
        backgroundColor: dark,
        body: Form(
          key: _formKey,
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: scaler.getHeight(2), right: scaler.getHeight(2)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: scaler.getHeight(7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Exit Button
                          Container(
                            width: scaler.getHeight(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient:turkish,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          //Edit Profile Button
                          Container(
                            height: scaler.getHeight(5),
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Edit Profile",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 36,
                                        color: white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          //Save Button
                          Container(
                            width: scaler.getHeight(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: turkish,
                            ),
                            child: IconButton(
                              onPressed: () {
                                updateUser();
                              },
                              icon: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Profile Picture
                    Padding(
                      padding: EdgeInsets.only(top: scaler.getHeight(2)),
                      child: Stack(
                        children: [
                          Container(
                            height: scaler.getWidth(40),
                            width: scaler.getWidth(40),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(scaler.getWidth(20))),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image(
                                  image: NetworkImage(photoUrL),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: scaler.getWidth(40),
                                      width: scaler.getWidth(40),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                              .expectedTotalBytes !=
                                              null
                                              ? loadingProgress
                                              .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),)
                              ),
                            ),

                          Positioned(
                            top: scaler.getWidth(28),
                            left: scaler.getWidth(29),
                            child: Container(
                              width: scaler.getHeight(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mainColor,
                                gradient: turkish,
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  widget.userBloc = BlocProvider.of(context);
                                  String photo = await widget.userBloc
                                      .getImageUrl(widget.user.uid);
                                  setState(() {
                                    photoUrL = photo;
                                  });
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Name Text Field
                    Padding(
                      padding: EdgeInsets.only(top: scaler.getHeight(2)),
                      child: Stack(children: [
                        Container(
                          padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                          alignment: Alignment.centerRight,
                          height: scaler.getHeight(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: mainColor,
                              ),
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                            height: scaler.getHeight(5),
                            child: TextFormField(
                              maxLength: 30,
                              textAlign: TextAlign.right,
                              validator: (input) {
                                if (input.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Container(
                                      alignment: Alignment.center,
                                      height: scaler.getHeight(2),
                                      child: Text(
                                        "Please dont leave any field empty",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                            )),
                                      ),
                                    ),
                                  ));
                                  return '';
                                }
                              },
                              onSaved: (input) {
                                name = input;
                              },
                              initialValue: widget.user.name,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
                                hintText: 'Aa',
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
                        ),
                        Container(
                          height: scaler.getHeight(5),
                          width: scaler.getHeight(12),
                          decoration: BoxDecoration(
                            gradient: turkish,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'Name',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        color: white,
                                        )),
                              ),
                            ),
                          ),
                        ),

                      ]),
                    ),
                    //Personality
                    Padding(
                      padding: EdgeInsets.only(top: scaler.getHeight(2)),
                      child: Stack(children: [

                        Container(
                          padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                          alignment: Alignment.centerRight,
                          height: scaler.getHeight(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: mainColor,
                              ),
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text((widget.user.personality != 'None') ? '${widget.user.personality} - ${PersonalityTestInfo().personalityName[widget.user.personality]}' : widget.user.personality,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Container(
                          height: scaler.getHeight(5),
                          width: scaler.getHeight(12),
                          decoration: BoxDecoration(
                            gradient: turkish,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'Personality',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    //College
                    Padding(
                      padding: EdgeInsets.only(top: scaler.getHeight(2)),
                      child: Stack(children: [

                        Container(
                          padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                          alignment: Alignment.centerRight,
                          height: scaler.getHeight(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: mainColor,
                              ),
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(widget.user.type,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Container(
                          height: scaler.getHeight(5),
                          width: scaler.getHeight(12),
                          decoration: BoxDecoration(
                            gradient: turkish,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'College',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),

                    // Description Text Field
                    Padding(
                      padding: EdgeInsets.only(
                          top: scaler.getHeight(2),
                          bottom: scaler.getHeight(2)),
                      child: Container(
                        child: Stack(children: [

                          Container(
                            padding:
                                EdgeInsets.only(left: scaler.getHeight(.5)),
                            alignment: Alignment.topLeft,
                            height: scaler.getHeight(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: mainColor,
                                ),
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: scaler.getHeight(4)),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty || input.trim().length == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Container(
                                        alignment: Alignment.center,
                                        height: scaler.getHeight(2),
                                        child: Text(
                                          "Please dont leave any field empty",
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            fontSize: 14,
                                          )),
                                        ),
                                      ),
                                    ));
                                    return '';
                                  }
                                },
                                onSaved: (input) {
                                  description = input;
                                },
                                maxLength: 170,
                                maxLines: 5,
                                initialValue: widget.user.description,
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16)),
                                decoration: InputDecoration(
                                  hintText: 'Aa',
                                  hintStyle: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                    fontSize: 16,
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
                          ),
                          Container(
                            height: scaler.getHeight(5),
                            alignment: Alignment(0, .5),
                            decoration: BoxDecoration(
                              gradient:turkish,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  'Description',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: scaler.getHeight(9),
          decoration: BoxDecoration(
              gradient: turkish),
        ),
      ),
    );
  }

  Future<void> updateUser() async {
    {
      final formState = _formKey.currentState;
      widget.userBloc = BlocProvider.of(context);
      if (formState.validate()) {
        formState.save();
        try {
          UserModel user = UserModel(
              email: widget.user.email,
              name: name,
              gender: widget.user.gender,
              photoUrL: photoUrL,
              personality: widget.user.personality,
              uid: widget.user.uid,
              groups: widget.user.groups,
              description: description,
              type: dropdownValue);
          widget.userBloc.updateUserData(user);
          Navigator.pop(context);
        } catch (e) {
          print(e.message);
        }
      }
    }
  }
}
