import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ExplorersScreen extends StatelessWidget {
  const ExplorersScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    Color color = Color(0xfff7e7cb);
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
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '''Explorers''',
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
                detail: """Virtuoso
(ISTP)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['ISTP'],
                alignment: Alignment(-.3, 0),
                color: color,
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Virtuoso (ISTP)""",
                  link: "https://www.16personalities.com/istp-personality",
                  subtitles: [
                    [
                      "WHO IS A VIRTUOSO (ISTP)?",
                      "A Virtuoso (ISTP) is someone with the Introverted, Observant, Thinking, and Prospecting personality traits. They tend to have an individualistic mindset, pursuing goals without needing much external connection. They engage in life with inquisitiveness and personal skill, varying their approach as needed. \n \n Virtuosos love to explore with their hands and their eyes, touching and examining the world around them with cool rationalism and spirited curiosity. People with this personality type are natural Makers, moving from project to project, building the useful and the superfluous for the fun of it, and learning from their environment as they go. Often mechanics and engineers, Virtuosos find no greater joy than in getting their hands dirty pulling things apart and putting them back together, just a little bit better than they were before. \n \n Virtuosos explore ideas through creating, troubleshooting, trial and error and first-hand experience. They enjoy having other people take an interest in their projects and sometimes don’t even mind them getting into their space. Of course, that’s on the condition that those people don’t interfere with Virtuosos’ principles and freedom, and they’ll need to be open to Virtuosos returning the interest in kind. \n \n Virtuosos enjoy lending a hand and sharing their experience, especially with the people they care about, and it’s a shame they’re so uncommon, making up only about five percent of the population. Virtuoso women are especially rare, and the typical gender roles that society tends to expect can be a poor fit – they’ll often be seen as tomboys from a young age."
                    ],
                    [
                      "Dare to Differ",
                      "While their mechanical tendencies can make them appear simple at a glance, Virtuosos are actually quite enigmatic. Friendly but very private, calm but suddenly spontaneous, extremely curious but unable to stay focused on formal studies, Virtuoso personalities can be a challenge to predict, even by their friends and loved ones. Virtuosos can seem very loyal and steady for a while, but they tend to build up a store of impulsive energy that explodes without warning, taking their interests in bold new directions. \n \n Virtuosos’ decisions stem from a sense of practical realism, and at their heart is a strong sense of direct fairness, a “do unto others” attitude, which really helps to explain many of Virtuosos’ puzzling traits. Instead of being overly cautious though, avoiding stepping on toes in order to avoid having their toes stepped on, Virtuosos are likely to go too far, accepting likewise retaliation, good or bad, as fair play. \n \n The biggest issue Virtuosos are likely to face is that they often act too soon, taking for granted their permissive nature and assuming that others are the same. They’ll be the first to tell an insensitive joke, get overly involved in someone else’s project, roughhouse and play around, or suddenly change their plans because something more interesting came up."
                    ],
                    [
                      "Nothing Is as Boring as Everyone Agreeing With You",
                      "Virtuosos will come to learn that many other personality types have much more firmly drawn lines on rules and acceptable behavior than they do – they don’t want to hear an insensitive joke, and certainly wouldn’t tell one back, and they wouldn’t want to engage in horseplay, even with a willing party. If a situation is already emotionally charged, violating these boundaries can backfire tremendously. \n \n Virtuosos have a particular difficulty in predicting emotions, but this is just a natural extension of their fairness, given how difficult it is to gauge Virtuosos’ emotions and motivations. However, their tendency to explore their relationships through their actions rather than through empathy can lead to some very frustrating situations. People with the Virtuoso personality type struggle with boundaries and guidelines, preferring the freedom to move about and color outside the lines if they need to. \n \n Finding an environment where they can work with good friends who understand their style and unpredictability, combining their creativity, sense of humor and hands-on approach to build practical solutions and things, will give Virtuosos many happy years of building useful boxes – and admiring them from the outside."
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
                detail: """Adventurer
(ISFP)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['ISFP'],
                color: color,
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Adventurer (ISFP)""",
                  link: "https://www.16personalities.com/isfp-personality",
                  subtitles: [
                    [
                      "WHO IS AN ADVENTURER (ISFP)?",
                      "An Adventurer (ISFP) is a person with the Introverted, Observant, Feeling, and Prospecting personality traits. They tend to have open minds, approaching life, new experiences, and people with grounded warmth. Their ability to stay in the moment helps them uncover exciting potentials. \n \n Adventurer personalities are true artists, but not necessarily in the typical sense where they’re out painting happy little trees. Often enough though, they are perfectly capable of this. Rather, it’s that they use aesthetics, design and even their choices and actions to push the limits of social convention. Adventurers enjoy upsetting traditional expectations with experiments in beauty and behavior – chances are, they’ve expressed more than once the phrase -Don’t box me in!-"
                    ],
                    [
                      "Happy to Be Who They Are",
                      "Adventurers live in a colorful, sensual world, inspired by connections with people and ideas. These personalities take joy in reinterpreting these connections, reinventing and experimenting with both themselves and new perspectives. No other type explores and experiments in this way more. This creates a sense of spontaneity, making Adventurers seem unpredictable, even to their close friends and loved ones. \n \n Despite all this, Adventurers are definitely Introverts, surprising their friends further when they step out of the spotlight to be by themselves to recharge. Just because they are alone though, doesn’t mean people with the Adventurer personality type sit idle – they take this time for introspection, assessing their principles. Rather than dwelling on the past or the future, Adventurers think about who they are. They return from their cloister, transformed. \n \n  Adventurers live to find ways to push their passions. Riskier behaviors like gambling and extreme sports are more common with this personality type than with others. Fortunately their attunement to the moment and their environment allows them to do better than most. Adventurers also enjoy connecting with others, and have a certain irresistible charm. \n \n However, if a criticism does get through, it can end poorly. Some Adventurers can handle kindly phrased commentary, valuing it as another perspective to help push their passions in new directions. But if the comments are more biting and less mature, Adventurer personalities can lose their tempers in spectacular fashion. \n \n Adventurers are sensitive to others’ feelings and value harmony. When faced with criticism, it can be a challenge for people with this type to step away from the moment long enough to not get caught up in the heat of the moment. But living in the moment goes both ways, and once the heightened emotions of an argument cool, Adventurers can usually call the past the past and move on as though it never occurred."
                    ],
                    [
                      "Meaning Is in Every Expression of Life",
                      "The biggest challenge facing Adventurers is planning for the future. Finding constructive ideals to base their goals on and working out goals that create positive principles is no small task. Adventurers don’t plan their futures in terms of assets and retirement. Rather, they plan actions and behaviors as contributions to a sense of identity, building a portfolio of experiences, not stocks. \n \n If these goals and principles are noble, Adventurers can act with amazing charity and selflessness – but it can also happen that people with the Adventurer personality type establish a more self-centered identity, acting with selfishness, manipulation and egoism. It’s important for Adventurers to remember to actively become the person they want to be. Developing and maintaining a new habit may not come naturally, but taking the time each day to understand their motivations allows Adventurers to use their strengths to pursue whatever they’ve come to love."
                    ]
                  ],
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
                detail: """Entrepreneur
(ESTP)"""
                    .trim(),
                color: color,
                image: PersonalityTestInfo().personalityIconsPath['ESTP'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Entrepreneur (ESTP)""",
                  link: "https://www.16personalities.com/estp-personality",
                  subtitles: [
                    [
                      "WHO IS AN ENTREPRENEUR (ESTP)?",
                      "An Entrepreneur (ESTP) is someone with the Extraverted, Observant, Thinking, and Prospecting personality traits. They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits. \n \n Entrepreneurs always have an impact on their immediate surroundings – the best way to spot them at a party is to look for the whirling eddy of people flitting about them as they move from group to group. Laughing and entertaining with a blunt and earthy humor, Entrepreneur personalities love to be the center of attention. If an audience member is asked to come on stage, Entrepreneurs volunteer – or volunteer a shy friend. \n \n Theory, abstract concepts and plodding discussions about global issues and their implications don’t keep Entrepreneurs interested for long. Entrepreneurs keep their conversation energetic, with a good dose of intelligence, but they like to talk about what is – or better yet, to just go out and do it. Entrepreneurs leap before they look, fixing their mistakes as they go, rather than sitting idle, preparing contingencies and escape clauses."
                    ],
                    [
                      "Never Confuse Movement With Action",
                      "Entrepreneurs are the likeliest personality type to make a lifestyle of risky behavior. They live in the moment and dive into the action – they are the eye of the storm. People with the Entrepreneur personality type enjoy drama, passion, and pleasure, not for emotional thrills, but because it’s so stimulating to their logical minds. They are forced to make critical decisions based on factual, immediate reality in a process of rapid-fire rational stimulus response. \n \n This makes school and other highly organized environments a challenge for Entrepreneurs. It certainly isn’t because they aren’t smart, and they can do well, but the regimented, lecturing approach of formal education is just so far from the hands-on learning that Entrepreneurs enjoy. It takes a great deal of maturity to see this process as a necessary means to an end, something that creates more exciting opportunities. \n \n Also challenging is that to Entrepreneurs, it makes more sense to use their own moral compass than someone else’s. Rules were made to be broken. This is a sentiment few high school instructors or corporate supervisors are likely to share, and can earn Entrepreneur personalities a certain reputation. But if they minimize the trouble-making, harness their energy, and focus through the boring stuff, Entrepreneurs are a force to be reckoned with."
                    ],
                    [
                      "Most People Don’t Listen Well Enough",
                      "With perhaps the most perceptive, unfiltered view of any type, Entrepreneurs have a unique skill in noticing small changes. Whether a shift in facial expression, a new clothing style, or a broken habit, people with this personality type pick up on hidden thoughts and motives where most types would be lucky to pick up anything specific at all. Entrepreneurs use these observations immediately, calling out the change and asking questions, often with little regard for sensitivity. Entrepreneurs should remember that not everyone wants their secrets and decisions broadcast. \n \n If Entrepreneurs aren’t careful though, they may get too caught in the moment, take things too far, and run roughshod over more sensitive people, or forget to take care of their own health and safety. Making up only four percent of the population, there are just enough Entrepreneurs out there to keep things spicy and competitive, and not so many as to cause a systemic risk. \n \n Entrepreneurs are full of passion and energy, complemented by a rational, if sometimes distracted, mind. Inspiring, convincing and colorful, they are natural group leaders, pulling everyone along the path less traveled, bringing life and excitement everywhere they go. Putting these qualities to a constructive and rewarding end is Entrepreneurs’ true challenge."
                    ]
                  ],
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
                detail: """Entertainer\n(ESFP)""".trim(),
                color: color,
                image: PersonalityTestInfo().personalityIconsPath['ESFP'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Entertainer (ESFP)""",
                  link: "https://www.16personalities.com/esfp-personality",
                  subtitles: [
                    [
                      "WHO IS AN ENTERTAINER (ESFP)?",
                      "An Entertainer (ESFP) is a person with the Extraverted, Observant, Feeling, and Prospecting personality traits. These people love vibrant experiences, engaging in life eagerly and taking pleasure in discovering the unknown. They can be very social, often encouraging others into shared activities. \n \n If anyone is to be found spontaneously breaking into song and dance, it is the Entertainer personality type. Entertainers get caught up in the excitement of the moment, and want everyone else to feel that way, too. No other personality type is as generous with their time and energy as Entertainers when it comes to encouraging others, and no other personality type does it with such irresistible style."
                    ],
                    [
                      "We Are All of Us Stars...",
                      "Entertainers love the spotlight, and all the world’s a stage. Many famous people with the Entertainer personality type are indeed actors, but they love putting on a show for their friends too, chatting with a unique and earthy wit, soaking up attention and making every outing feel a bit like a party. Utterly social, Entertainers enjoy the simplest things, and there’s no greater joy for them than just having fun with a good group of friends. \n \n It’s not just talk either – Entertainers have the strongest aesthetic sense of any personality type. From grooming and outfits to a well-appointed home, Entertainer personalities have an eye for fashion. Knowing what’s attractive the moment they see it, Entertainers aren’t afraid to change their surroundings to reflect their personal style. Entertainers are naturally curious, exploring new designs and styles with ease. \n \n Though it may not always seem like it, Entertainers know that it’s not all about them – they are observant, and very sensitive to others’ emotions. People with this personality type are often the first to help someone talk out a challenging problem, happily providing emotional support and practical advice. However, if the problem is about them, Entertainers are more likely to avoid a conflict altogether than to address it head-on. Entertainers usually love a little drama and passion, but not so much when they are the focus of the criticisms it can bring."
                    ],
                    [
                      "...And We Deserve to Twinkle",
                      "The biggest challenge Entertainers face is that they are often so focused on immediate pleasures that they neglect the duties and responsibilities that make those luxuries possible. Complex analysis, repetitive tasks, and matching statistics to real consequences are not easy activities for Entertainers. They’d rather rely on luck or opportunity, or simply ask for help from their extensive circle of friends. It is important for Entertainers to challenge themselves to keep track of long-term things like their retirement plans or sugar intake – there won’t always be someone else around who can help to keep an eye on these things. \n \n Entertainers recognize value and quality, which on its own is a fine trait. In combination with their tendency to be poor planners though, this can cause them to live beyond their means, and credit cards are especially dangerous. More focused on leaping at opportunities than in planning out long-term goals, Entertainers may find that their inattentiveness has made some activities unaffordable. \n \n Entertainers are welcome wherever there’s a need for laughter, playfulness, and a volunteer to try something new and fun – and there’s no greater joy for Entertainer personalities than to bring everyone else along for the ride. Entertainers can chat for hours, sometimes about anything but the topic they meant to talk about, and share their loved ones’ emotions through good times and bad. If they can just remember to keep their ducks in a row, they’ll always be ready to dive into all the new and exciting things the world has to offer, friends in tow."
                    ]
                  ],
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
