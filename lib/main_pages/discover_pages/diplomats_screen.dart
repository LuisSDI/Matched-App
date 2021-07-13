import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class DiplomatsScreen extends StatelessWidget {
  const DiplomatsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    Color color = Color(0xffB5fc89);
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
                        '''Diplomats''',
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
                detail: """Advocate
(INFJ)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['INFJ'],
                alignment: Alignment(-.3, 0),
                color: color,
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: [
                    'assets/images/personalities/test/diplomats/advocate1.jpg',
                    'assets/images/personalities/test/diplomats/advocate2.jpg',
                    'assets/images/personalities/test/diplomats/advocate3.jpg'
                  ],
                  title: """Advocate (INFJ)""",
                  link: "https://www.16personalities.com/infj-personality",
                  subtitles: [
                    [
                      "WHO IS AN ADVOCATE (INFJ)?",
                      "An Advocate (INFJ) is someone with the Introverted, Intuitive, Feeling, and Judging personality traits. They tend to approach life with deep thoughtfulness and imagination. Their inner vision, personal values, and a quiet, principled version of humanism guide them in all things. \n \n Advocates are the rarest personality types of all. Still, Advocates leave their mark on the world. They have a deep sense of idealism and integrity, but they aren’t idle dreamers – they take concrete steps to realize their goals and make a lasting impact. \n \n Advocates’ unique combination of personality traits makes them complex and quite versatile. For example, Advocates can speak with great passion and conviction, especially when standing up for their ideals. At other times, however, they may choose to be soft-spoken and understated, preferring to keep the peace rather than challenge others."
                    ],
                    [
                      "Standing Up for What’s Right",
                      "Advocates generally strive to do what’s right – and they want to help create a world where others do the right thing as well. People with this personality type may feel called to use their strengths – including creativity, imagination, and sensitivity – to uplift others and spread compassion. Concepts like egalitarianism and karma can mean a great deal to Advocates. \n \n Advocates may see helping others as their purpose in life. They are troubled by injustice, and they typically care more about altruism than personal gain. As a result, Advocates tend to step in when they see someone facing unfairness or hardship. Many people with this personality type also aspire to fix society’s deeper problems, in the hope that unfairness and hardship can become things of the past."
                    ],
                    [
                      "Connecting with Others (and Themselves)",
                      "Advocates may be reserved, but they communicate in a way that is warm and sensitive. This emotional honesty and insight can make a powerful impression on the people around them. \n \n Advocates value deep, authentic relationships with others, and they tend to take great care with other people’s feelings. That said, these personalities also need to prioritize reconnecting with themselves. Advocates need to take some time alone now and then to decompress, recharge, and process their thoughts and feelings."
                    ],
                    [
                      "The Cost of Success",
                      "At times, Advocates may focus so intently on their ideals that they don’t take care of themselves. Advocates may feel that they aren’t allowed to rest until they’ve achieved their unique vision of success, but this mindset can lead to stress and burnout. If this happens, people with this personality type may find themselves feeling uncharacteristically ill-tempered. \n \n Advocates might find themselves feeling especially stressed in the face of conflict and criticism. These personalities tend to act with the best of intentions, and it can frustrate them when others don’t appreciate this. At times, even constructive criticism may feel deeply personal or hurtful to Advocates."
                    ],
                    [
                      "A Personal Mission",
                      "Many Advocates feel compelled to find a mission for their lives. When they encounter inequity or unfairness, they tend to think, “How can I fix this?” They are well-suited to support a movement to right a wrong, no matter how big or small. Advocates just need to remember that while they’re busy taking care of the world, they need to take care of themselves too."
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
                detail: """Mediator
(INFP)"""
                    .trim(),
                image: PersonalityTestInfo().personalityIconsPath['INFP'],
                color: color,
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: [
                    'assets/images/personalities/test/diplomats/mediator1.png',
                    'assets/images/personalities/test/diplomats/mediator2.jpg',
                    'assets/images/personalities/test/diplomats/mediator3.jpg'
                  ],
                  title: """Mediator (INFP)""",
                  link: "https://www.16personalities.com/infp-personality",
                  subtitles: [
                    [
                      "WHO IS A MEDIATOR (INFP)?",
                      "A Mediator (INFP) is someone who possesses the Introverted, Intuitive, Feeling, and Prospecting personality traits. These rare personality types tend to be quiet, open-minded, and imaginative, and they apply a caring and creative approach to everything they do. \n \n Although they may seem quiet or unassuming, Mediators (INFPs) have vibrant, passionate inner lives. Creative and imaginative, they happily lose themselves in daydreams, inventing all sorts of stories and conversations in their minds. These personalities are known for their sensitivity – Mediators can have profound emotional responses to music, art, nature, and the people around them. \n \n Idealistic and empathetic, Mediators long for deep, soulful relationships, and they feel called to help others. But because this personality type makes up such a small portion of the population, Mediators may sometimes feel lonely or invisible, adrift in a world that doesn’t seem to appreciate the traits that make them unique."
                    ],
                    [
                      "The Gift of Empathy",
                      "Mediators share a sincere curiosity about the depths of human nature. Introspective to the core, they’re exquisitely attuned to their own thoughts and feelings, but they yearn to understand the people around them as well. Mediators are compassionate and nonjudgmental, always willing to hear another person’s story. When someone opens up to them or turns to them for comfort, they feel honored to listen and be of help. \n \n Empathy is among this personality type’s greatest gifts, but at times it can be a liability. The troubles of the world weigh heavily on Mediators’ shoulders, and these personalities can be vulnerable to internalizing other people’s negative moods or mindsets. Unless they learn to set boundaries, Mediators may feel overwhelmed by just how many wrongs there are that need to be set right."
                    ],
                    [
                      "Speaking Their Truth",
                      "Few things make Mediators more uneasy than pretending to be someone they aren’t. With their sensitivity and their commitment to authenticity, people with this personality type tend to crave opportunities for creative self-expression. It comes as no surprise, then, that many famous Mediators are poets, writers, actors, and artists. They can’t help but muse about the meaning and purpose of life, dreaming up all sorts of stories, ideas, and possibilities along the way. \n \n Through these imaginative landscapes, Mediators can explore their own inner nature as well as their place in the world. While this is a beautiful trait, these personalities sometimes show a tendency to daydream and fantasize rather than take action. To avoid feeling frustrated, unfulfilled, or incapable, Mediators need to make sure that they take steps to turn their dreams and ideas into reality."
                    ],
                    [
                      "In Search of a Calling",
                      "People with this personality type tend to feel directionless or stuck until they connect with a sense of purpose for their lives. For many Mediators, this purpose has something to do with uplifting others and their ability to feel other people’s suffering as if it were their own. While Mediators want to help everyone, they need to focus their energy and efforts – otherwise, they can end up exhausted. \n \n Fortunately, like flowers in the spring, Mediators’ creativity and idealism can bloom even after the darkest of seasons. Although they know the world will never be perfect, Mediators still care about making it better however they can. This quiet belief in doing the right thing may explain why these personalities so often inspire compassion, kindness, and beauty wherever they go."
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
                detail: """Protagonist
(ENFJ)"""
                    .trim(),
                color: color,
                image: PersonalityTestInfo().personalityIconsPath['ENFJ'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: [
                    'assets/images/personalities/test/diplomats/protagonist1.jpg',
                    'assets/images/personalities/test/diplomats/protagonist2.jpg',
                    'assets/images/personalities/test/diplomats/protagonist3.jpg'
                  ],
                  title: """Protagonist (ENFJ)""",
                  link: "https://www.16personalities.com/enfj-personality",
                  subtitles: [
                    [
                      "WHO IS A PROTAGONIST (ENFJ)?",
                      "A Protagonist (ENFJ) is a person with the Extraverted, Intuitive, Feeling, and Judging personality traits. These warm, forthright types love helping others, and they tend to have strong ideas and values. They back their perspective with the creative energy to achieve their goals. \n \n Protagonists (ENFJs) feel called to serve a greater purpose in life. Thoughtful and idealistic, these personality types strive to have a positive impact on other people and the world around them. They rarely shy away from an opportunity to do the right thing, even when doing so is far from easy. \n \n Protagonists are born leaders, which explains why these personalities can be found among many notable politicians, coaches, and teachers. Their passion and charisma allow them to inspire others not just in their careers but in every arena of their lives, including their relationships. Few things bring Protagonists a deeper sense of joy and fulfillment than guiding friends and loved ones to grow into their best selves."
                    ],
                    [
                      "Speaking Up for What’s Right",
                      "Protagonists tend to be vocal about their values, including authenticity and altruism. When something strikes them as unjust or wrong, they speak up. But they rarely come across as brash or pushy, as their sensitivity and insight guide them to speak in ways that resonate with others. \n \n These personality types have an uncanny ability to pick up on people’s underlying motivations and beliefs. At times, they may not even understand how they come to grasp another person’s mind and heart so quickly. These flashes of insight can make Protagonists incredibly persuasive and inspiring communicators. \n \n Protagonists’ secret weapon is their purity of intent. Generally speaking, they are motivated by a sincere wish to do the right thing rather than a desire to manipulate or have power over other people. Even when they disagree with someone, Protagonists search for common ground. The result is that people with this personality type can communicate with an eloquence and sensitivity that are nearly impossible to ignore – particularly when they speak about matters that are close to their hearts."
                    ],
                    [
                      "Getting Involved",
                      "When Protagonists care about someone, they want to help solve that person’s problems – sometimes at any cost. The good news is that many people are grateful for Protagonists’ assistance and advice. After all, there’s a reason that these personalities have a reputation for helping others improve their lives. \n \n But getting involved in other people’s problems isn’t always a recipe for success. Protagonists tend to have a clear vision of what people can or should do in order to better themselves, but not everyone is ready to make those changes. If Protagonists push too hard, their loved ones may feel resentful or unfairly judged. And while this personality type is known for being insightful, even the wisest Protagonists may sometimes misread a situation or unwittingly give bad advice."
                    ],
                    [
                      "Leading the Way",
                      "People with this personality type are devoted altruists, ready to face slings and arrows in order to stand up for the people and ideas that they believe in. This strength of conviction bolsters Protagonists’ innate leadership skills, particularly their ability to guide people to work together in service of the greater good. \n \n But their greatest gift might actually be leading by example. In their day-to-day lives, Protagonists reveal how seemingly ordinary situations can be handled with compassion, dedication, and care. For these personalities, even the smallest daily choices and actions – from how they spend their weekend to what they say to a coworker who is struggling – can become an opportunity to lead the way to a brighter future."
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
                detail: """Campaigner \n(ENFP)""".trim(),
                color: color,
                image: PersonalityTestInfo().personalityIconsPath['ENFP'],
                alignment: Alignment(-.3, 0),
                screen: PersonalityTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: [
                    'assets/images/personalities/test/diplomats/campaigner1.png',
                    'assets/images/personalities/test/diplomats/campaigner2.jpg',
                    'assets/images/personalities/test/diplomats/campaigner3.jpg'
                  ],
                  title: """Campaigner (ENFP)""",
                  link: "https://www.16personalities.com/enfp-personality",
                  subtitles: [
                    [
                      "WHO IS A CAMPAIGNER (ENFP)?",
                      "A Campaigner (ENFP) is someone with the Extraverted, Intuitive, Feeling, and Prospecting personality traits. These people tend to embrace big ideas and actions that reflect their sense of hope and goodwill toward others. Their vibrant energy can flow in many directions. \n \n Campaigners (ENFPs) are true free spirits – outgoing, openhearted, and open-minded. With their lively, upbeat approach to life, they stand out in any crowd. But even though they can be the life of the party, Campaigners don’t just care about having a good time. These personality types run deep – as does their longing for meaningful, emotional connections with other people."
                    ],
                    [
                      "The Magic of Everyday Life",
                      "Friendly and outgoing, Campaigners are devoted to enriching their relationships and their social lives. But beneath their sociable, easygoing exteriors, they have rich, vibrant inner lives as well. Without a healthy dose of imagination, creativity, and curiosity, a Campaigner simply wouldn’t be a Campaigner. \n \n In their unique way, Campaigners can be quite introspective. They can’t help but ponder the deeper meaning and significance of life – even when they should be paying attention to something else. These personalities believe that everything – and everyone – is connected, and they live for the glimmers of insight that they can gain into these connections. \n \n When something sparks their imagination, Campaigners can show an enthusiasm that is nothing short of infectious. These personalities radiate a positive energy that draws in other people, and Campaigners may find themselves being held up by their peers as a leader or guru. But once the initial bloom of inspiration wears off, Campaigners can struggle with self-discipline and consistency, losing steam on projects that once meant so much to them."
                    ],
                    [
                      "Seeking Joy",
                      "Campaigners are proof that seeking out life’s joys and pleasures isn’t the same as being shallow. Seemingly in the blink of an eye, people with this personality type can transform from impassioned idealists to carefree figures on the dance floor. \n \n Even in moments of fun, Campaigners want to connect emotionally with others. Few things matter more to these personality types than having genuine, heartfelt conversations with the people they cherish. Campaigners believe that everyone deserves to express their feelings, and their empathy and warmth create spaces where even the most timid spirits can feel comfortable opening up. \n \n People with this personality type need to be careful, however. Campaigners’ intuition may lead them to read far too much into other people’s actions and behaviors. Instead of simply asking for an explanation, Campaigners may end up puzzling over someone else’s desires or intentions. This kind of social stress is what keeps harmony-focused Campaigners awake at night. \n \n Campaigners will spend a lot of time exploring different relationships, feelings, and ideas before they find a path for their lives that feels right. But when they finally do find their way, their imagination, empathy, and courage can light up not only their own lives but also the world around them."
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
