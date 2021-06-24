import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_screen.dart';
import 'package:matched_app/main_pages/explore_pages/facilities_screen.dart';
import 'package:matched_app/main_pages/explore_pages/faq_screen.dart';
import 'package:matched_app/main_pages/explore_pages/services_screen.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/resources/screen_buttom.dart';
import 'package:matched_app/resources/simple_buttom.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: SafeArea(
        top: false,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ImageSlider(key: key, imgList: CollegesInfo().collegesList),
                Container(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/image_1.png'),
                    fit: BoxFit.cover,
                    //width: scaler.getWidth(110),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: scaler.getWidth(8),
                  mainAxisSpacing: scaler.getWidth(8),
                  padding: EdgeInsets.all(scaler.getWidth(5)),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ScreenButtom(
                      detail: 'Colleges',
                      iconData: Ionicons.ios_bed,
                      screen: CollegeScreen(),
                      //WhyScreen(),
                    ),
                    ScreenButtom(
                      detail: 'Facilities',
                      iconData: FontAwesome5.building,
                      screen: FacilitiesScreen(),
                      //WhyScreen(),
                    ),
                    ScreenButtom(
                      detail: 'FAQs',
                      iconData: Icons.question_answer,
                      screen: FaqScreen(),
                      //WhyScreen(),
                    ),
                    ScreenButtom(
                      detail: 'Services',
                      iconData: Icons.local_mall,
                      screen: ServiceScreen(),
                      //WhyScreen(),
                    ),
                  ],
                ),
                // SimpleButtonAdvanced(
                //     text: 'Create Groups',
                //     onTap: () {
                //       List<String> personalityTypes =
                //           PersonalityTestInfo().personalityName.values.toList();
                //       List<String> personalityRoles = PersonalityTestInfo()
                //           .personalityRoles
                //           .values
                //           .toSet()
                //           .toList();
                //       print(personalityRoles);
                //       print(personalityTypes);
                //       List<String> allGroups = [
                //         personalityTypes,
                //         personalityRoles
                //       ].expand((x) => x).toList();
                //       List<List<String>> pairValues =
                //           PersonalityTestInfo().pairValues;
                //       for (var i = 0; i < pairValues.length; i++) {
                //         allGroups = [allGroups, pairValues[i]]
                //             .expand((x) => x)
                //             .toList();
                //       }
                //       for (var j = 0; j < allGroups.length; j++) {
                //         userBloc.createGroup(allGroups[j]);
                //       }
                //
                //       print(allGroups);
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
