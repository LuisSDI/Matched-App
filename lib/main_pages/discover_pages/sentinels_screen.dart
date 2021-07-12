import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class SentinelsScreen extends StatelessWidget {
  const SentinelsScreen({
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
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '''Sentinels''',
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
                detail: """Logistician
(ISTJ)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['ISTJ'],
                alignment: Alignment(-.3, 0),
                color: Color(0xffdbeee6),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Logistician (ISTJ)""",
                  link: "https://www.16personalities.com/istj-personality",
                  subtitles: [
                    [
                      "WHO IS A LOGISTICIAN (ISTJ)?",
                      "A Logistician (ISTJ) is someone with the Introverted, Observant, Thinking, and Judging personality traits. These people tend to be reserved yet willful, with a rational outlook on life. They compose their actions carefully and carry them out with methodical purpose. \n \n The Logistician personality type is thought to be the most abundant, making up around 13% of the population. Their defining characteristics of integrity, practical logic and tireless dedication to duty make Logisticians a vital core to many families, as well as organizations that uphold traditions, rules and standards, such as law offices, regulatory bodies and military. People with the Logistician personality type enjoy taking responsibility for their actions, and take pride in the work they do – when working towards a goal, Logisticians hold back none of their time and energy completing each relevant task with accuracy and patience. \n \n Logisticians don’t make many assumptions, preferring instead to analyze their surroundings, check their facts and arrive at practical courses of action. Logistician personalities are no-nonsense, and when they’ve made a decision, they will relay the facts necessary to achieve their goal, expecting others to grasp the situation immediately and take action. Logisticians have little tolerance for indecisiveness, but lose patience even more quickly if their chosen course is challenged with impractical theories, especially if they ignore key details – if challenges becomes time-consuming debates, Logisticians can become noticeably angry as deadlines tick nearer."
                    ],
                    [
                      "Associate With Those of Good Quality if You Esteem Your Reputation...",
                      "When Logisticians say they are going to get something done, they do it, meeting their obligations no matter the personal cost, and they are baffled by people who don’t hold their own word in the same respect. Combining laziness and dishonesty is the quickest way to get on Logisticians’ bad side. Consequently, people with the Logistician personality type often prefer to work alone, or at least have their authority clearly established by hierarchy, where they can set and achieve their goals without debate or worry over other’s reliability. \n \n Logisticians have sharp, fact-based minds, and prefer autonomy and self-sufficiency to reliance on someone or something. Dependency on others is often seen by Logisticians as a weakness, and their passion for duty, dependability and impeccable personal integrity forbid falling into such a trap. \n \n This sense of personal integrity is core to Logisticians, and goes beyond their own minds – Logistician personalities adhere to established rules and guidelines regardless of cost, reporting their own mistakes and telling the truth even when the consequences for doing so could be disastrous. To Logisticians, honesty is far more important than emotional considerations, and their blunt approach leaves others with the false impression that Logisticians are cold, or even robotic. People with this type may struggle to express emotion or affection outwardly, but the suggestion that they don’t feel, or worse have no personality at all, is deeply hurtful."
                    ],
                    [
                      "...For It Is Better to Be Alone Than in Bad Company",
                      "Logisticians’ dedication is an excellent quality, allowing them to accomplish much, but it is also a core weakness that less scrupulous individuals take advantage of. Logisticians seek stability and security, considering it their duty to maintain a smooth operation, and they may find that their coworkers and significant others shift their responsibilities onto them, knowing that they will always take up the slack. Logisticians tend to keep their opinions to themselves and let the facts do the talking, but it can be a long time before observable evidence tells the whole story. \n \n Logisticians need to remember to take care of themselves – their stubborn dedication to stability and efficiency can compromise those goals in the long term as others lean ever-harder on them, creating an emotional strain that can go unexpressed for years, only finally coming out after it’s too late to fix. If they can find coworkers and spouses who genuinely appreciate and complement their qualities, who enjoy the brightness, clarity and dependability that they offer, Logisticians will find that their stabilizing role is a tremendously satisfying one, knowing that they are part of a system that works."
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
                detail: """Defender
(ISFJ)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['ISFJ'],
                color: Color(0xffdbeee6),
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Defender (ISFJ)""",
                    link: "https://www.16personalities.com/isfj-personality",
                    subtitles: [
                      [
                        "WHO IS A DEFENDER (ISFJ)?",
                        "A Defender (ISFJ) is someone with the Introverted, Observant, Feeling, and Judging personality traits. These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives. \n \n The Defender personality type is quite unique, as many of their qualities defy the definition of their individual traits. Though sensitive, Defenders have excellent analytical abilities; though reserved, they have well-developed people skills and robust social relationships; and though they are generally a conservative type, Defenders are often receptive to change and new ideas. As with so many things, people with the Defender personality type are more than the sum of their parts, and it is the way they use these strengths that defines who they are. \n \n There’s hardly a better type to make up such a large proportion of the population, nearly 13%. Combining the best of tradition and the desire to do good, Defenders are found in lines of work with a sense of history behind them, such as medicine, academics and charitable social work. \n \n Defender personalities (especially Turbulent ones) are often meticulous to the point of perfectionism, and though they procrastinate, they can always be relied on to get the job done on time. Defenders take their responsibilities personally, consistently going above and beyond, doing everything they can to exceed expectations and delight others, at work and at home."
                      ],
                      [
                        "We Must Be Seen to Be Believed",
                        "The challenge for Defenders is ensuring that what they do is noticed. They have a tendency to underplay their accomplishments, and while their kindness is often respected, more cynical and selfish people are likely to take advantage of Defenders’ dedication and humbleness by pushing work onto them and then taking the credit. Defenders need to know when to say no and stand up for themselves if they are to maintain their confidence and enthusiasm. \n \n Naturally social, an odd quality for Introverts, Defenders utilize excellent memories not to retain data and trivia, but to remember people, and details about their lives. When it comes to gift-giving, Defenders have no equal, using their imagination and natural sensitivity to express their generosity in ways that touch the hearts of their recipients. While this is certainly true of their coworkers, whom people with the Defender personality type often consider their personal friends, it is in family that their expressions of affection fully bloom."
                      ],
                      [
                        "If I Can Protect You, I Will",
                        "Defender personalities are a wonderful group, rarely sitting idle while a worthy cause remains unfinished. Defenders’ ability to connect with others on an intimate level is unrivaled among Introverts, and the joy they experience in using those connections to maintain a supportive, happy family is a gift for everyone involved. They may never be truly comfortable in the spotlight, and may feel guilty taking due credit for team efforts, but if they can ensure that their efforts are recognized, Defenders are likely to feel a level of satisfaction in what they do that many other personality types can only dream of."
                      ]
                    ]),
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
                detail: """Executive \n(ESTJ)""".trim(),
                color: Color(0xffdbeee6),
                image: PersonalityTestInfo().personalityIconsPath['ESTJ'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Executive (ESTJ)""",
                  link: "https://www.16personalities.com/estj-personality",
                  subtitles: [
                    [
                      "WHO IS AN EXECUTIVE (ESTJ)?",
                      "An Executive (ESTJ) is someone with the Extraverted, Observant, Thinking, and Judging personality traits. They possess great fortitude, emphatically following their own sensible judgment. They often serve as a stabilizing force among others, able to offer solid direction amid adversity. \n \n Executives are representatives of tradition and order, utilizing their understanding of what is right, wrong and socially acceptable to bring families and communities together. Embracing the values of honesty, dedication and dignity, people with the Executive personality type are valued for their clear advice and guidance, and they happily lead the way on difficult paths. Taking pride in bringing people together, Executives often take on roles as community organizers, working hard to bring everyone together in celebration of cherished local events, or in defense of the traditional values that hold families and communities together."
                    ],
                    [
                      "Anyone Worth Their Salt Sticks Up for What They Believe Is Right...",
                      "Demand for such leadership is high in democratic societies, and forming no less than 11% of the population, it’s no wonder that many of America’s presidents have been Executives. Strong believers in the rule of law and authority that must be earned, Executive personalities lead by example, demonstrating dedication and purposeful honesty, and an utter rejection of laziness and cheating, especially in work. If anyone declares hard, manual work to be an excellent way to build character, it is Executives. \n \n Executives are aware of their surroundings and live in a world of clear, verifiable facts – the surety of their knowledge means that even against heavy resistance, they stick to their principles and push an unclouded vision of what is and is not acceptable. Their opinions aren’t just empty talk either, as Executives are more than willing to dive into the most challenging projects, improving action plans and sorting details along the way, making even the most complicated tasks seem easy and approachable. \n \n However, Executives don’t work alone, and they expect their reliability and work ethic to be reciprocated – people with this personality type meet their promises, and if partners or subordinates jeopardize them through incompetence or laziness, or worse still, dishonesty, they do not hesitate to show their wrath. This can earn them a reputation for inflexibility, a trait shared by all Sentinel personalities, but it’s not because Executives are arbitrarily stubborn, but because they truly believe that these values are what make society work."
                    ],
                    [
                      "...But Still Better Are Those Who Acknowledge When They Are in Error",
                      "The main challenge for Executives is to recognize that not everyone follows the same path or contributes in the same way. A true leader recognizes the strength of the individual, as well as that of the group, and helps bring those individuals’ ideas to the table. That way, Executives really do have all the facts, and are able to lead the charge in directions that work for everyone."
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
                detail: """Consul \n(ESFJ)""".trim(),
                color: Color(0xffdbeee6),
                image: PersonalityTestInfo().personalityIconsPath['ESFJ'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Consul (ESFJ)""",
                  link: "https://www.16personalities.com/esfj-personality",
                  subtitles: [
                    [
                      "WHO IS A CONSUL (ESFJ)?",
                      "A Consul (ESFJ) is a person with the Extraverted, Observant, Feeling, and Judging personality traits. They are attentive and people-focused, and they enjoy taking part in their social community. Their achievements are guided by decisive values, and they willingly offer guidance to others. \n \n People who share the Consul personality type are, for lack of a better word, popular – which makes sense, given that it is also a very common personality type, making up twelve percent of the population. In high school, Consuls are the cheerleaders and the quarterbacks, setting the tone, taking the spotlight and leading their teams forward to victory and fame. Later in life, Consuls continue to enjoy supporting their friends and loved ones, organizing social gatherings and doing their best to make sure everyone is happy. \n \n Discussing scientific theories or debating European politics isn’t likely to capture Consuls’ interest for too long. Consuls are more concerned with fashion and their appearance, their social status and the standings of other people. Practical matters and gossip are their bread and butter, but Consuls do their best to use their powers for good."
                    ],
                    [
                      "Respecting the Wisdom of Leadership",
                      "Consuls are altruists, and they take seriously their responsibility to help and to do the right thing. Unlike their Diplomat relatives however, people with the Consul personality type will base their moral compass on established traditions and laws, upholding authority and rules, rather than drawing their morality from philosophy or mysticism. It’s important for Consuls to remember though, that people come from many backgrounds and perspectives, and what may seem right to them isn’t always an absolute truth. \n \n Consuls love to be of service, enjoying any role that allows them to participate in a meaningful way, so long as they know that they are valued and appreciated. This is especially apparent at home, and Consuls make loyal and devoted partners and parents. Consul personalities respect hierarchy, and do their best to position themselves with some authority, at home and at work, which allows them to keep things clear, stable and organized for everyone."
                    ],
                    [
                      "Play Dates Aren’t Just for the Kids!",
                      "Supportive and outgoing, Consuls can always be spotted at a party – they’re the ones finding time to chat and laugh with everyone! But their devotion goes further than just breezing through because they have to. Consuls truly enjoy hearing about their friends’ relationships and activities, remembering little details and always standing ready to talk things out with warmth and sensitivity. If things aren’t going right, or there’s tension in the room, Consuls pick up on it and to try to restore harmony and stability to the group. \n \n Being pretty conflict-averse, Consuls spend a lot of their energy establishing social order, and prefer plans and organized events to open-ended activities or spontaneous get-togethers. People with this personality type put a lot of effort into the activities they’ve arranged, and it’s easy for Consuls’ feelings to be hurt if their ideas are rejected, or if people just aren’t interested. Again, it’s important for Consuls to remember that everyone is coming from a different place, and that disinterest isn’t a comment about them or the activity they’ve organized – it’s just not their thing. \n \n Coming to terms with their sensitivity is Consuls’ biggest challenge – people are going to disagree and they’re going to criticize, and while it hurts, it’s just a part of life. The best thing for Consuls to do is to do what they do best: be a role model, take care of what they have the power to take care of, and enjoy that so many people do appreciate the efforts they make."
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
