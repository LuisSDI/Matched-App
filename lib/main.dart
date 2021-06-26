import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/login/sign_page.dart';
import 'package:matched_app/onboarding/onboarding_main.dart';
import 'package:matched_app/resources/circular_progress_page.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_pages/home_page.dart';

int initScreen = 1;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  await GetStorage.init();
  final datacount = GetStorage();
  if(datacount.read('initScreen')!= null)
  {
    initScreen = datacount.read('initScreen');
  }
  datacount.writeIfNull("initScreen", 1);
  print('initScreen $initScreen');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Matched!',
        theme: ThemeData(
          primaryColor: dark,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
        ),
          initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
          routes:{
            '/': (context) {
              UserBloc userBloc = BlocProvider.of(context);
              return StreamBuilder<User>(
                stream: userBloc.authStatus,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomePage(
                      currentIndex: 0,
                    );
                  } else if (snapshot.hasError) {
                    return Text("An error has occur, verify your connection and try later");
                  } else if (snapshot.connectionState !=
                      ConnectionState.waiting) {
                    return SignPage();
                  } else {
                    return CircularProgressPage();
                  }
                },
              );
            },
            "first": (context) => OnboardingMain(),
          },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
