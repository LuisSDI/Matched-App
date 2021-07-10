import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/paragraph.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class TestExplanation extends StatelessWidget {
  @override
  final List<String> imagesList;
  final String title;

  TestExplanation({Key key, this.imagesList, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      backgroundColor: dark,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(3), bottom: scaler.getHeight(1.5)),
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
                    height: scaler.getHeight(5),
                    width: scaler.getWidth(80),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        title,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 34,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Image Carousel
            ImageSlider(
              imgList: ['assets/images/personalities/test/personality_test_1.jpg',
              'assets/images/personalities/test/personality_test_2.jpg',
              'assets/images/personalities/test/personality_test_3.png',
              'assets/images/personalities/test/personality_test_4.jpg'],
            ),
            //Intro Text //add paragraph from here
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Text(
                """Have you ever heard someone describe themselves as an INTJ or an ESTP and wondered what those cryptic-sounding letters could mean? What these people are referring to is their personality type based on the Myers-Briggs Type Indicator (MBTI).

The Myers-Briggs Personality Type Indicator is a self-report inventory designed to identify a person's personality type, strengths, and preferences. The questionnaire was developed by Isabel Myers and her mother Katherine Briggs based on their work with Carl Jung's theory of personality types. Today, the MBTI inventory is one of the most widely used psychological instruments in the world.""",
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 16, color: whiteish, height: 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                //height: scaler.getHeight(43),
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "The Development of the Myers-Briggs Test",
                    text:
                        """Both Myers and Briggs were fascinated by Jung's theory of psychological types and recognized that the theory could have real-world applications. During World War II, they began researching and developing an indicator that could be utilized to help understand individual differences.

By helping people understand themselves, Myers and Briggs believed that they could help people select occupations that were best suited to their personality types and lead healthier, happier lives.

Myers created the first pen-and-pencil version of the inventory during the 1940s, and the two women began testing the assessment on friends and family. They continued to fully develop the instrument over the next two decades."""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "An Overview of the Test",
                    text:
                        """Based on the answers to the questions on the inventory, people are identified as having one of 16 personality types. The goal of the MBTI is to allow respondents to further explore and understand their own personalities including their likes, dislikes, strengths, weaknesses, possible career preferences, and compatibility with other people.

No one personality type is "best" or "better" than another. It isn't a tool designed to look for dysfunction or abnormality. Instead, its goal is simply to help you learn more about yourself. The questionnaire itself is made up of four different scales."""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "Extraversion (E) – Introversion (I)",
                    text:
                        """The extraversion-introversion dichotomy was first explored by Jung in his theory of personality types as a way to describe how people respond and interact with the world around them. While these terms are familiar to most people, the way in which they are used in the MBTI differs somewhat from their popular usage.

Extraverts (also often spelled extroverts) are "outward-turning" and tend to be action-oriented, enjoy more frequent social interaction, and feel energized after spending time with other people. Introverts are "inward-turning" and tend to be thought-oriented, enjoy deep and meaningful social interactions, and feel recharged after spending time alone.

We all exhibit extraversion and introversion to some degree, but most of us tend to have an overall preference for one or the other."""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "Sensing (S) – Intuition (N)",
                    text:
                        """This scale involves looking at how people gather information from the world around them. Just like with extraversion and introversion, all people spend some time sensing and intuiting depending on the situation. According to the MBTI, people tend to be dominant in one area or the other.

People who prefer sensing tend to pay a great deal of attention to reality, particularly to what they can learn from their own senses. They tend to focus on facts and details and enjoy getting hands-on experience. Those who prefer intuition pay more attention to things like patterns and impressions. They enjoy thinking about possibilities, imagining the future, and abstract theories."""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "Thinking (T) – Feeling (F)",
                    text:
                        """This scale focuses on how people make decisions based on the information that they gathered from their sensing or intuition functions. People who prefer thinking place a greater emphasis on facts and objective data.

They tend to be consistent, logical, and impersonal when weighing a decision. Those who prefer feeling are more likely to consider people and emotions when arriving at a conclusion."""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaler.getWidth(1.5),
                  vertical: scaler.getWidth(1)),
              child: Container(
                alignment: Alignment.topLeft,
                child: Paragraph(
                    title: "Judging (J) – Perceiving (P)",
                    text:
                        """The final scale involves how people tend to deal with the outside world. Those who lean toward judging prefer structure and firm decisions. People who lean toward perceiving are more open, flexible, and adaptable. These two tendencies interact with the other scales.

Remember, all people at least spend some time extraverting. The judging-perceiving scale helps describe whether you extravert when you are taking in new information (sensing and intuiting) or when you are making decisions (thinking and feeling)."""),
              ),
            ),
            SizedBox()
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
