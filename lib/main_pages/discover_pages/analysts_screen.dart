import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class AnalystsScreen extends StatelessWidget {
  const AnalystsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      backgroundColor: dark,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: scaler.getHeight(3)),
              child: Row(
                children: <Widget>[
                  //Buttom for back
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Ionicons.ios_arrow_back,
                        color: mainColor,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  //Title Text
                  Container(
                    //height: scaler.getHeight(11),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '''Analysts''',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 36,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //CSE Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: """Architect
(INTJ)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['INTJ'],
                alignment: Alignment(-.3, 0),
                color: Color(0xffF5D7E3),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Architect (INTJ)""",
                  link:
                      "https://www.16personalities.com/intj-strengths-and-weaknesses",
                  subtitles: [
                    [
                      "WHO IS AN ARCHITECT (INTJ)?",
                      "An Architect (INTJ) is a person with the Introverted, Intuitive, Thinking, and Judging personality traits. These thoughtful tacticians love perfecting the details of life, applying creativity and rationality to everything they do. Their inner world is often a private, complex one."
                    ],
                    [
                      "A Thirst for Knowledge",
                      "These personalities can be both the boldest of dreamers and the bitterest of pessimists. Architects believe that, through willpower and intelligence, they can achieve even the most challenging of goals. But they may be cynical about human nature more generally, assuming that most people are lazy, unimaginative, or simply doomed to mediocrity. \n \n Architects derive much of their self-esteem from their knowledge and mental acuity. In school, people with this personality type may have been called “bookworms” or “nerds.” But rather than taking these labels as insults, many Architects embrace them. They are confident in their ability to teach themselves about – and master – any topic that interests them, whether that’s coding or capoeira or classical music. \n \n Architects can be single-minded, with little patience for frivolity, distractions, or idle gossip. That said, it would be a mistake to stereotype these personalities as dull or humorless. Many Architects are known for their irreverent wit, and beneath their serious exteriors, they often have a sharp, delightfully sarcastic sense of humor."
                    ],
                    [
                      "Finding a Better Way",
                      "Architects question everything. Many personality types trust the status quo, relying on conventional wisdom and other people’s expertise as they go about their lives. But ever-skeptical Architects prefer to make their own discoveries. In their quest to find better ways of doing things, they aren’t afraid to break the rules or risk disapproval – in fact, they rather enjoy it. \n \n But as anyone with this personality type would tell you, a new idea isn’t worth anything unless it actually works. Architects want to be successful, not just inventive. They bring a single-minded drive to their passion projects, applying the full force of their insight, logic, and willpower. And heaven help anyone who tries to slow them down by enforcing pointless rules or offering poorly thought-out criticism. \n \n This personality type comes with a strong independent streak. Architects don’t mind acting alone, perhaps because they don’t like waiting around for others to catch up with them. "
                    ],
                    [
                      "Social Frustrations",
                      "Architects aren’t known for being warm and fuzzy. They tend to prioritize rationality and success over politeness and pleasantries – in other words, they’d rather be right than popular. This may explain why so many fictional villains are modeled on this personality type. \n \n Because Architects value truth and depth, many common social practices – from small talk to white lies – may seem pointless or downright stupid to them. As a result, they may inadvertently come across as rude or even offensive when they’re only trying to be honest. At times, Architects may wonder if dealing with other people is even worth the frustration. \n \nBut like any personality type, Architects do crave social interaction – they’d just prefer to surround themselves with people who share their values and priorities. Often, they can achieve this just by being themselves. When Architects pursue their interests, their natural confidence can draw people to them – professionally, socially, and even romantically."
                    ],
                    [
                      "The Chess Game of Life",
                      "This personality type is full of contradictions. Architects are imaginative yet decisive, ambitious yet private, and curious yet focused. From the outside, these contradictions may seem baffling, but they make perfect sense once you understand the inner workings of the Architect mind. \n \n For Architects, life is like a giant game of chess. Relying on strategy rather than chance, they contemplate the strengths and weaknesses of each move before they make it. And they never lose faith that, with enough ingenuity and insight, they can find a way to win – no matter what challenges might arise along the way."
                    ]
                  ],
                ),
              ),
            ),
            //EIE Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: """Logician
(INTP)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['INTP'],
                color: Color(0xffF5D7E3),
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Logician (INTP)""",
                ),
              ),
            ),
            //NES Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: """Commander
(ENTJ)"""
                    .trim(),
                color: Color(0xffF5D7E3),
                image: PersonalityTestInfo().personalityIconsPath['ENTJ'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Commander (ENTJ)""",
                ),
              ),
            ),
            //Math Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: """Debater
(ENTP)"""
                    .trim(),
                color: Color(0xffF5D7E3),
                image: PersonalityTestInfo().personalityIconsPath['ENTP'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Debater (ENTP)""",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: scaler.getHeight(10),
        decoration: BoxDecoration(gradient: turkish),
      ),
    );
  }
}
