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
                  link:
                      "https://www.16personalities.com/intp-strengths-and-weaknesses",
                  subtitles: [
                    [
                      "WHO IS A LOGICIAN (INTP)?",
                      "A Logician (INTP) is someone with the Introverted, Intuitive, Thinking, and Prospecting personality traits. These flexible thinkers enjoy taking an unconventional approach to many aspects of life. They often seek out unlikely paths, mixing willingness to experiment with personal creativity."
                    ],
                    [
                      "The Life of the Mind",
                      "Logicians often lose themselves in thought – which isn’t necessarily a bad thing. People with this personality type hardly ever stop thinking. From the moment they wake up, their minds buzz with ideas, questions, and insights. At times, they may even find themselves conducting full-fledged debates in their own heads. \n \n From the outside, Logicians may seem to live in a never-ending daydream. They have a reputation for being pensive, detached, and a bit reserved. That is, until they try to train all of their mental energy on the moment or the person at hand, which can be a bit uncomfortable for everyone. But regardless of which mode they’re in, Logicians are Introverts and tend to get tired out by extensive socializing. After a long day, they crave time alone to consult their own thoughts. \n \n But it would be a mistake to think that Logicians are unfriendly or uptight. When they connect with someone who can match their mental energy, these personalities absolutely light up, leaping from one thought to another. Few things energize them like the opportunity to swap ideas or enjoy a lively debate with another curious, inquiring soul."
                    ],
                    [
                      "Elementary, My Dear Logician",
                      "Logicians love to analyze patterns. Without necessarily knowing how they do it, people with this personality type often have a Sherlock Holmes–like knack for spotting discrepancies and irregularities. In other words, it’s a bad idea to lie to them. \n \n Ironically, Logicians shouldn’t always be held at their word. They rarely mean to be dishonest, but with their active minds, they sometimes overflow with ideas and theories that they haven’t thought through all the way. They may change their mind on anything from their weekend plans to a fundamental moral principle, without ever realizing that they’d appeared to have made up their mind in the first place. In addition, they are often happy to play devil’s advocate in order to keep an interesting discussion humming along. \n \n Logicians could spend all day musing about ideas and possibilities – and they often do. That said, the practical, everyday work of turning those ideas into reality doesn’t always hold their interest. Fortunately, when it comes to dissecting a tricky, multilayered problem and coming up with a creative solution, few personality types can match Logicians’ creative genius and potential."
                    ],
                    [
                      "Mysteries of the Universe",
                      "People with this personality type want to understand everything in the universe, but one area in particular tends to mystify them: human nature. As their name suggests, Logicians feel most at home in the realm of logic and rationality. As a result, they can find themselves baffled by the illogical, irrational ways that feelings and emotions influence people’s behavior – including their own.\n \n This doesn’t mean that Logicians are unfeeling. These personalities generally want to offer emotional support to their friends and loved ones, but they don’t necessarily know how. And because they can’t decide on the best, most efficient way to offer support, they may hold off on doing or saying anything at all. \n \n This “analysis paralysis” can affect multiple areas of Logicians’ lives. People with this personality type can overthink even the smallest of decisions. This makes them feel ineffective and stuck, so exhausted by the endless parade of thoughts in their mind that they struggle to get things done.\n \n The good news is that Logicians don’t have to stay stuck for long. Their unique strengths include everything they need to pull themselves out of the ruts that they occasionally fall into. By leveraging their creativity and their open-mindedness, Logicians can reach their full potential – both as thinkers and as happy, well-rounded people."
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
                  link:
                      "https://www.16personalities.com/entj-strengths-and-weaknesses",
                  subtitles: [
                    [
                      "WHO IS A COMMANDER (ENTJ)?",
                      "A Commander (ENTJ) is someone with the Extraverted, Intuitive, Thinking, and Judging personality traits. They are decisive people who love momentum and accomplishment. They gather information to construct their creative visions but rarely hesitate for long before acting on them. \n \n Commanders are natural-born leaders. People with this personality type embody the gifts of charisma and confidence, and project authority in a way that draws crowds together behind a common goal. However, Commanders are also characterized by an often ruthless level of rationality, using their drive, determination and sharp minds to achieve whatever end they’ve set for themselves. Perhaps it is best that they make up only three percent of the population, lest they overwhelm the more timid and sensitive personality types that make up much of the rest of the world – but we have Commanders to thank for many of the businesses and institutions we take for granted every day."
                    ],
                    [
                      "Happiness Lies in the Joy of Achievement",
                      "If there’s anything Commanders love, it’s a good challenge, big or small, and they firmly believe that given enough time and resources, they can achieve any goal. This quality makes people with the Commander personality type brilliant entrepreneurs, and their ability to think strategically and hold a long-term focus while executing each step of their plans with determination and precision makes them powerful business leaders. This determination is often a self-fulfilling prophecy, as Commanders push their goals through with sheer willpower where others might give up and move on, and their Extraverted (E) nature means they are likely to push everyone else right along with them, achieving spectacular results in the process. \n \n At the negotiating table, be it in a corporate environment or buying a car, Commanders are dominant, relentless, and unforgiving. This isn’t because they are coldhearted or vicious per se – it’s more that Commander personalities genuinely enjoy the challenge, the battle of wits, the repartee that comes from this environment, and if the other side can’t keep up, that’s no reason for Commanders to fold on their own core tenet of ultimate victory. \n \n If there’s anyone Commanders respect, it’s someone who is able to stand up to them intellectually, who is able to act with a precision and quality equal to their own. Commander personalities have a particular skill in recognizing the talents of others, and this helps in both their team-building efforts (since no one, no matter how brilliant, can do everything alone), and to keep Commanders from displaying too much arrogance and condescension. However, they also have a particular skill in calling out others’ failures with a chilling degree of insensitivity, and this is where Commanders really start to run into trouble."
                    ],
                    [
                      "Cultivating the Science of Human Relationships",
                      "Emotional expression isn’t the strong suit of any Analyst type, but Commanders’ distance from their emotions is especially public, and felt directly by a much broader swath of people. Especially in a professional environment, Commanders will simply crush the sensitivities of those they view as inefficient, incompetent or lazy. To people with the Commander personality type, emotional displays are displays of weakness, and it’s easy to make enemies with this approach – Commanders will do well to remember that they absolutely depend on having a functioning team, not just to achieve their goals, but for their validation and feedback as well, something Commanders are, curiously, very sensitive to. \n \n Commanders are true powerhouses, and they cultivate an image of being larger than life – and often enough they are. They need to remember though, that their stature comes not just from their own actions, but from the actions of the team that props them up, and that it’s important to recognize the contributions, talents and needs, especially from an emotional perspective, of their support network. Even if they have to adopt a fake it ‘til you make it mentality, if Commanders are able to combine an emotionally healthy focus alongside their many strengths, they will be rewarded with deep, satisfying relationships and all the challenging victories they can handle."
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
                  link:
                      "https://www.16personalities.com/entp-strengths-and-weaknesses",
                  subtitles: [
                    [
                      "WHO IS A DEBATER (ENTP)?",
                      "A Debater (ENTP) is a person with the Extraverted, Intuitive, Thinking, and Prospecting personality traits. They tend to be bold and creative, deconstructing and rebuilding ideas with great mental agility. They pursue their goals vigorously despite any resistance they might encounter. \n \n No one loves the process of mental sparring more than the Debater personality type, as it gives them a chance to exercise their effortlessly quick wit, broad accumulated knowledge base, and capacity for connecting disparate ideas to prove their points. Debaters are the ultimate devil’s advocate, thriving on the process of shredding arguments and beliefs and letting the ribbons drift in the wind for all to see. They don’t always do this because they are trying to achieve some deeper purpose or strategic goal, though. Sometimes it’s for the simple reason that it’s fun. \n \n Playing the devil’s advocate helps people with the Debater personality type to not only develop a better sense of others’ reasoning, but a better understanding of opposing ideas – since Debaters are the ones arguing them. \n \n This tactic shouldn’t be confused with the sort of mutual understanding Diplomat personalities seek – Debaters, like all Analyst personality types, are on a constant quest for knowledge, and what better way to gain it than to attack and defend an idea, from every angle, from every side?"
                    ],
                    [
                      "There Are no Rules Here – We’re Trying to Accomplish Something!",
                      "Taking a certain pleasure in being the underdog, Debaters enjoy the mental exercise found in questioning the prevailing mode of thought, making them irreplaceable in reworking existing systems or shaking things up and pushing them in clever new directions. However, they’ll be miserable managing the day-to-day mechanics of actually implementing their suggestions. Debater personalities love to brainstorm and think big, but they will avoid getting caught doing the “grunt work” at all costs. Debaters only make up about three percent of the population, which is just right, as it lets them create original ideas, then step back to let more numerous and fastidious personalities handle the logistics of implementation and maintenance. \n \n Debaters’ capacity for debate can be a vexing one – while often appreciated when it’s called for, it can fall painfully flat when they step on others’ toes by say, openly questioning their boss in a meeting, or picking apart everything their significant other says. This is further complicated by Debaters’ unyielding honesty, as this type doesn’t mince words and cares little about being seen as sensitive or compassionate. Likeminded types get along well enough with people with the Debater personality type, but more sensitive types, and society in general, are often conflict-averse, preferring feelings, comfort, and even white lies over unpleasant truths and hard rationality. \n \n This frustrates Debaters, and they find that their quarrelsome fun burns many bridges, oftentimes inadvertently, as they plow through others’ thresholds for having their beliefs questioned and their feelings brushed aside. Treating others as they’d be treated, Debaters have little tolerance for being coddled, and dislike when people beat around the bush, especially when asking a favor. Debater personalities find themselves respected for their vision, confidence, knowledge, and keen sense of humor, but often struggle to utilize these qualities as the basis for deeper friendships and romantic relationships."
                    ],
                    [
                      "Opportunity Is Missed Because It Looks Like Hard Work",
                      "Debaters have a longer road than most in harnessing their natural abilities – their intellectual independence and free-form vision are tremendously valuable when they’re in charge, or at least have the ear of someone who is, but getting there can take a level of follow-through that Debaters struggle with. \n \n Once they’ve secured such a position, Debaters need to remember that for their ideas to come to fruition, they will always depend on others to assemble the pieces – if they’ve spent more time “winning” arguments than they have building consensus, many Debaters will find they simply don’t have the support necessary to be successful. Playing devil’s advocate so well, people with this personality type may find that the most complex and rewarding intellectual challenge is to understand a more sentimental perspective, and to argue consideration and compromise alongside logic and progress."
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
