import 'package:flutter/material.dart';
import 'package:matched_app/Onboarding/onboarding_main.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/bloc/user_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        home: OnboardingMain(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
