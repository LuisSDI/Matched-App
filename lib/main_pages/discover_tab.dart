import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/analysts_screen.dart';
import 'package:matched_app/main_pages/discover_pages/diplomats_screen.dart';
import 'package:matched_app/main_pages/discover_pages/explorers_screen.dart';
import 'package:matched_app/main_pages/discover_pages/sentinels_screen.dart';
import 'package:matched_app/main_pages/discover_pages/test_explanation.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/college_template.dart';
import 'package:matched_app/resources/main_page_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/fix_icons_icons.dart';

class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return SafeArea(
      top: false,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: scaler.getWidth(7), right: scaler.getWidth(7)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Discover Text
                Padding(
                  padding: EdgeInsets.only(top: scaler.getWidth(7)),
                  child: Container(
                    height: scaler.getHeight(5),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Personality",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 36,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                //Subtitle Text
                Container(
                  height: scaler.getHeight(3),
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Who you are?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 23,
                        color: whiteish,
                      )),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    //Foundation Courses
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: scaler.getHeight(2.5)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestExplanation(
                                        title: 'How does it work?',
                                        imagesList: [
                                          'assets/images/disc/d.png',
                                          'assets/images/disc/i.png',
                                          'assets/images/disc/s.png',
                                          'assets/images/disc/c.png'
                                        ],
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: turkish,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x80000000),
                                  blurRadius: 4.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    6, // Move to bottom 10 Vertically
                                  ),
                                )
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(scaler.getHeight(1)),
                            alignment: Alignment.center,
                            child: Text(
                              'How does the test work?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      //height: .5,
                                      fontSize: 23,
                                      color: white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: scaler.getHeight(1),
                          bottom: scaler.getHeight(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //SSE Button
                          Container(
                            width: scaler.getWidth(33),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: MainPageButton(
                                iconData: FixIcons.analyst,
                                text: "Analysts",
                                // screen: CollegeTemplate(
                                //   desc:
                                //       "-General Characteristics- \n Direct, Decisive, High Ego Strength, Problem Solver, Risk Taker, Self Starter. \n \n -Possible Weaknesses- \n Oversteps authority, Argumentative attitude, Dislikes routine, Attempts too much at once. \n \n -Greatest Fear- \n Being taken advantage of. \n \n -Motivated By- \n New challenges, Power and authority to take risks and make decisions, Freedom from routine and mundane tasks, Changing environments in which to work and play. \n \n -Strength- \n Dominant personality types are task-oriented, decisive and competitive. They care more about task and result rather than their personal relationship with others. They are a great business partner or project team. Dominant personality types also tend to be impatient and controlling. They love to be fast, move fast, think fast, so they can make a decision and move on. Other behaviours that they usually have are direct, innovative, persistent, adventurous, problem-solver, and result-oriented. \n \n -What to Improve- \n But dominant personality types are relatively lacking in empathy for others. Others can think that dominant people are arrogant and bossy. The hardest part for people with dominant personality type is for them to care and understand how others’ feel. Others might think they are arrogant, but they cannot understand why others think so. They can improve with start to think about other’s feelings, how to be empathy to others, and how to slow down. ",
                                //   imagesList: ['assets/images/disc/d.png'],
                                //   title: """Dominance""",
                                // ),
                                screen: AnalystsScreen(),
                              ),
                            ),
                          ),
                          //SME Button
                          Container(
                            width: scaler.getWidth(33),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: MainPageButton(
                                text: "Diplomats",
                                iconData: FixIcons.diplomats,
                                // screen: CollegeTemplate(
                                //   desc:
                                //       "-General Characteristics- \n  Enthusiastic. Trusting; Optimistic. Persuasive. Talkative. Impulsive. Emotional. \n \n -Possible Weaknesses- \n  More concerned with popularity than tangible results. Inattentive to detail. Overuses gestures and facial expressions. Tends to listen only when it's convenient. \n \n -Greatest Fear- \n Rejection. \n \n -Motivated By- \n Flattery, praise, popularity, and acceptance. A friendly environment. Freedom from many rules and regulations. Other people available to handle details. \n \n -Strength- \n Influential personality types love to be the center of attention. They are active, enthusiastic, charming, optimist, spontaneous, flexible, and creative. They care about the people around them more than their task or job. They like to interact with people and build relationships. They also tend to be direct and open, and they move fast. They are easy to build a relationship with others, they have their charm to attract people around them. \n \n -What to Improve- \n Influential personality types are usually emotional, moody, not detailed, selfish, and swift thinker. They will feel depressed doing things the same way over and over again, or having a monotone life because they are very active and they need variation in what they do. They can improve themselves by trying to be more organized in doing things and put focus more on their jobs.",
                                //   imagesList: ['assets/images/disc/i.png'],
                                //   title: """Influence""",
                                // ),
                                screen: DiplomatsScreen(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: scaler.getHeight(1),
                          bottom: scaler.getHeight(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //HSS Button
                          Container(
                            width: scaler.getWidth(33),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: MainPageButton(
                                iconData: FixIcons.sentinel,
                                text: "Sentinels",
                                // screen: CollegeTemplate(
                                //   desc:
                                //       "-General Characteristics- \n Good listener. Team player. Possessive. Steady. Predictable. Understanding. Friendly. \n\n -Possible Weaknesses- \n Resists change. Takes a long time to adjust to change. Holds a grudge. Sensitive to criticism. Difficulty establishing priorities. \n\n -Greatest Fear- \n Loss of security. \n\n -Motivated By- \n Recognition for loyalty and dependability. Safety and security. No sudden changes in procedure or lifestyle. Activities that can be started and finished. \n \n -Strength- \n The main strength of steady personality types are patient, calm, and willingness to help others. We may see them as peace loving and very diplomatic. They are calm and warm-heartedly. They are good listeners, people enjoy talking to them. They are people-oriented, they can understand the feelings of people talking to them. The motto fits with the steady personality type is “One best friend is better than thousands of friends”. \n \n -What to Improve- \n Steady personality types are usually passive, pessimistic, shy, possessive, procrastinator, and sluggish. They feel shy easily especially when they are surrounded by new people, the level of shyness decrease as their closeness to the people around them. They can improve themselves by starting to think positive, be grateful of small good things. They can also start their job as soon as they remember, and finish it sooner.",
                                //   imagesList: ['assets/images/disc/s.png'],
                                //   title: """Steadiness""",
                                // ),
                                screen: SentinelsScreen(),
                              ),
                            ),
                          ),
                          //LHS Button
                          Container(
                            width: scaler.getWidth(33),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: MainPageButton(
                                iconData: FixIcons.explorer,
                                text: 'Explorers',
                                // screen: CollegeTemplate(
                                //   desc:
                                //       "-General Characteristics- \n Accurate; analytical. Conscientious; careful. Fact-finder; precise. High standards; systematic. \n\n -Possible Weaknesses- \n Needs clear-cut boundaries for actions/relationships. Bound by procedures and methods. Gets bogged down in details. Prefers not to verbalize feelings. Will give in rather that argue. \n\n -Greatest Fear- \n Criticism. \n\n -Motivated By- \n Standards of high quality. Limited social interaction. Detailed tasks. Logical organization of information. \n\n -Strength- \n \n Just as the personality type “conscientious”, they are precise or accurate. They are also detail, systematic, critical, facts-oriented, orderly, and disciplined. They love following procedures in both personal life and work life. They are not easily agreed with people, they will think things through by collecting the facts they had and they tend to do their job perfectly. They are the definition of neat and structured people. \n \n -What to Improve- \n \n Perfectionism is a good thing, but when it reaches the spot where it is “over”, it will affect both themselves and their workmates. They are usually pessimistic, rigid, subjective, hard to believe in people, like to judge others, over-worried, and over-thinking. They can improve themselves by putting their trust in others and be objective. They should also take a short break and relax. ",
                                //   imagesList: ['assets/images/disc/c.png'],
                                //   title: """Conscientious""",
                                // ),
                                screen: ExplorersScreen(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
