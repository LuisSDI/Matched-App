import 'package:matched_app/MatchingQuizz/listUsers.dart';

class PersonalityTestInfo {
  List<String> questions = [
    '1. When you go somewhere for the day, would you rather',
    '2. If you were a teacher, would you rather teach',
    '3. Are you usually',
    '4. Do you more often let',
    '5. In doing something that many other people do, would you rather',
    '6. Among your friends are you',
    '7. Does the idea of making a list of what you should get done over a weekend',
    '8. When you have a special job to do, do you like to',
    '9. Do you tend to have',
    '10. Do you admire more the people who are',
    '11. Do you prefer to',
    '12. Do you usually get along better with',
    '13. When you are with the group of people, would you usually rather',
    '14. Is it a higher compliment to be called',
    '15. In reading for pleasure, do you',
    '16. Do you',
    '17. Does following a schedule',
    '18. When it is settled well in advance that you will do a certain thing at a certain time,do you find it',
    '19. Are you more successful',
    '20. Would you rather be considered',
    '21. In a large group, do you more often',
    '22. Do you usually',
    '23. Would you rather have as a friend',
    '24. Can the new people you meet tell what you are interested in',
    '25. (On this question only, if two answers are true, circle both) In your daily work, do you',
    '26. Do you usually'
  ];

  Map<int, List<String>> answers = {
    0: [
      'Plan what you will do and when, or',
      'Just go!!',
    ],
    1: [
      'Facts-based courses, or',
      'Courses involving opinion or theory?',
    ],
    2: [
      'A “good mixer” with groups of people, or',
      'Rather quiet and reserved?',
    ],
    3: [
      'Your heart rule your head, or',
      'Your head rule your heart?',
    ],
    4: [
      'Invent a way of your own, or',
      'Do it in the accepted way?',
    ],
    5: [
      'Full of news about everybody, or',
      'One of the last to hear what is going on?',
    ],
    6: [
      'Help you, or',
      'Stress you, or',
      'Positively depress you?',
    ],
    7: [
      'Organize it carefully before you start, or',
      'Find out what is necessary as you go along?',
    ],
    8: [
      'Broad friendships with many different people, or',
      'Deep friendship with very few people?',
    ],
    9: [
      'Normal-acting to never make themselves the center of attention, or',
      'Too original and individual to care whether they are the center of attention or not',
    ],
    10: [
      'Arrange picnics, parties etc, well in advance, or',
      'Be free to do whatever to looks like fun when the time comes?',
    ],
    11: [
      'Realistic people, or',
      'Imaginative people?',
    ],
    12: [
      'Join in the talk of the group or',
      'Stand back and listen first?',
    ],
    13: [
      'A person of realfeeling, or',
      'A consistently reasonable person?',
    ],
    14: [
      'Enjoy odd or original ways of saying things, or',
      'Like writers to say exactly what they mean?',
    ],
    15: [
      'Talk easily to almost anyone for as long as you have to, or',
      'Find a lot to say only to certain people or under certain conditions?',
    ],
    16: [
      'Appeal to you, or',
      'Cramp you?',
    ],
    17: [
      'Nice to be able to plan accordingly, or',
      'A little unpleasant to be tied down?',
    ],
    18: [
      'At following a carefully worked out plan, or',
      'At dealing with the unexpected and seeing quickly what should be done?',
    ],
    19: [
      'A practical person, or',
      'An out-of-the-box-thinking person?',
    ],
    20: [
      'Introduce others, or',
      'Get introduced?',
    ],
    21: [
      'Value emotion more than logic, or',
      'Value logic more than feelings?',
    ],
    22: [
      'Someone who is always coming up with new ideas, or',
      'Someone who has both feet on the ground?',
    ],
    23: [
      'Right away,',
      'Only after they really get to know you?',
    ],
    24: [
      'Usually plan your work so you won’t need to work under pressure, or',
      'Rather enjoy an emergency that makes you work against time, or',
      'Hate to work under pressure?',
    ],
    25: [
      'Show your feelings freely, or',
      'Keep your feelings to yourself?',
    ]
  };

  Map<int, List<String>> partIIOptions = {
    0: [
      'Scheduled',
      'Unplanned',
    ],
    1: [
      'Facts',
      'Ideas',
    ],
    2: [
      'Quiet',
      'Hearty',
    ],
    3: [
      'Convincing',
      'Touching',
    ],
    4: [
      'Imaginative',
      'Matter-of-fact',
    ],
    5: [
      'Benefits',
      'Blessings',
    ],
    6: [
      'Peacemaker',
      'Judge',
    ],
    7: [
      'Systematic',
      'Spontaneous',
    ],
    8: [
      'Statement',
      'Concept',
    ],
    9: [
      'Reserved',
      'Talakative',
    ],
    10: [
      'Analyze',
      'Sympathize',
    ],
    11: [
      'Create',
      'Make',
    ],
    12: [
      'Determined',
      'Devoted',
    ],
    13: [
      'Gentle',
      'Firm',
    ],
    14: [
      'Systematic',
      'Casual',
    ],
    15: [
      'Certainty',
      'Theory',
    ],
    16: [
      'Calm',
      'Lively',
    ],
    17: [
      'Justice',
      'Mercy',
    ],
    18: [
      'Fascinating',
      'Sensible',
    ],
    19: [
      'Firm-minded',
      'Warm hearted',
    ],
    20: [
      'Feeling',
      'Thinking',
    ],
    21: [
      'Literal',
      'Figurative',
    ],
    22: [
      'Anticipation',
      'Compassion',
    ],
    23: [
      'Hard',
      'Soft',
    ]
  };

  Map<String, String> personalityIntro = {
    'INTJ': 'Imaginative and strategic thinkers, with a plan for everything.',
    'INTP': 'Innovative inventors with an unquenchable thirst for knowledge.',
    'ENTJ':
        'Bold, imaginative and strong-willed leaders, always finding a way – or making one',
    'ENTP':
        'Smart and curious thinkers who cannot resist an intellectual challenge.',
    'INFJ': 'Quiet and mystical, yet very inspiring and tireless idealists.',
    'INFP':
        'Poetic, kind and altruistic people, always eager to help a good cause.',
    'ENFJ':
        'Charismatic and inspiring leaders, able to mesmerize their listeners.',
    'ENFP':
        'Enthusiastic, creative and sociable free spirits, who can always find a reason to smile.',
    'ISTJ':
        'Practical and fact-minded individuals, whose reliability cannot be doubted.',
    'ISFJ':
        'Very dedicated and warm protectors, always ready to defend their loved ones.',
    'ESTJ':
        'Excellent administrators, unsurpassed at managing things – or people.',
    'ESFJ':
        'Extraordinarily caring, social and popular people, always eager to help.',
    'ISTP': 'Bold and practical experimenters, masters of all kinds of tools.',
    'ISFP':
        'Flexible and charming artists, always ready to explore and experience something new.',
    'ESTP':
        'Smart, energetic and very perceptive people, who truly enjoy living on the edge.',
    'ESFP':
        'Spontaneous, energetic and enthusiastic people – life is never boring around them.',
  };

  Map<String, String> personalityName = {
    'INTJ': 'Architect',
    'INTP': 'Logician',
    'ENTJ': 'Commander',
    'ENTP': 'Debater',
    'INFJ': 'Advocate',
    'INFP': 'Mediator',
    'ENFJ': 'Protagonist',
    'ENFP': 'Campaigner',
    'ISTJ': 'Logistician',
    'ISFJ': 'Defender',
    'ESTJ': 'Executive',
    'ESFJ': 'Consul',
    'ISTP': 'Virtuoso',
    'ISFP': 'Adventurer',
    'ESTP': 'Entrepreneur',
    'ESFP': 'Entertainer',
  };


  Map<String, String> personalityRoles = {
    'INTJ': 'Analysts',
    'INTP': 'Analysts',
    'ENTJ': 'Analysts',
    'ENTP': 'Analysts',
    'INFJ': 'Diplomats',
    'INFP': 'Diplomats',
    'ENFJ': 'Diplomats',
    'ENFP': 'Diplomats',
    'ISTJ': 'Sentinels',
    'ISFJ': 'Sentinels',
    'ESTJ': 'Sentinels',
    'ESFJ': 'Sentinels',
    'ISTP': 'Explorers',
    'ISFP': 'Explorers',
    'ESTP': 'Explorers',
    'ESFP': 'Explorers',
  };

  Map<String, String> personalityDesc = {
    'INTJ':
        'An Architect (INTJ) is a person with the Introverted, Intuitive, Thinking, and Judging personality traits. These thoughtful tacticians love perfecting the details of life, applying creativity and rationality to everything they do. Their inner world is often a private, complex one.',
    'INTP':
        'A Logician (INTP) is someone with the Introverted, Intuitive, Thinking, and Prospecting personality traits. These flexible thinkers enjoy taking an unconventional approach to many aspects of life. They often seek out unlikely paths, mixing willingness to experiment with personal creativity.',
    'ENTJ':
        'A Commander (ENTJ) is someone with the Extraverted, Intuitive, Thinking, and Judging personality traits. They are decisive people who love momentum and accomplishment. They gather information to construct their creative visions but rarely hesitate for long before acting on them.',
    'ENTP':
        'A Debater (ENTP) is a person with the Extraverted, Intuitive, Thinking, and Prospecting personality traits. They tend to be bold and creative, deconstructing and rebuilding ideas with great mental agility. They pursue their goals vigorously despite any resistance they might encounter.',
    'INFJ':
        'An Advocate (INFJ) is someone with the Introverted, Intuitive, Feeling, and Judging personality traits. They tend to approach life with deep thoughtfulness and imagination. Their inner vision, personal values, and a quiet, principled version of humanism guide them in all things.',
    'INFP':
        'A Mediator (INFP) is someone who possesses the Introverted, Intuitive, Feeling, and Prospecting personality traits. These rare personality types tend to be quiet, open-minded, and imaginative, and they apply a caring and creative approach to everything they do.',
    'ENFJ':
        'A Protagonist (ENFJ) is a person with the Extraverted, Intuitive, Feeling, and Judging personality traits. These warm, forthright types love helping others, and they tend to have strong ideas and values. They back their perspective with the creative energy to achieve their goals.',
    'ENFP':
        'A Campaigner (ENFP) is someone with the Extraverted, Intuitive, Feeling, and Prospecting personality traits. These people tend to embrace big ideas and actions that reflect their sense of hope and goodwill toward others. Their vibrant energy can flow in many directions.',
    'ISTJ':
        'A Logistician (ISTJ) is someone with the Introverted, Observant, Thinking, and Judging personality traits. These people tend to be reserved yet willful, with a rational outlook on life. They compose their actions carefully and carry them out with methodical purpose.',
    'ISFJ':
        'A Defender (ISFJ) is someone with the Introverted, Observant, Feeling, and Judging personality traits. These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives.',
    'ESTJ':
        'An Executive (ESTJ) is someone with the Extraverted, Observant, Thinking, and Judging personality traits. They possess great fortitude, emphatically following their own sensible judgment. They often serve as a stabilizing force among others, able to offer solid direction amid adversity.',
    'ESFJ':
        'A Consul (ESFJ) is a person with the Extraverted, Observant, Feeling, and Judging personality traits. They are attentive and people-focused, and they enjoy taking part in their social community. Their achievements are guided by decisive values, and they willingly offer guidance to others.',
    'ISTP':
        'A Virtuoso (ISTP) is someone with the Introverted, Observant, Thinking, and Prospecting personality traits. They tend to have an individualistic mindset, pursuing goals without needing much external connection. They engage in life with inquisitiveness and personal skill, varying their approach as needed.',
    'ISFP':
        'An Adventurer (ISFP) is a person with the Introverted, Observant, Feeling, and Prospecting personality traits. They tend to have open minds, approaching life, new experiences, and people with grounded warmth. Their ability to stay in the moment helps them uncover exciting potentials.',
    'ESTP':
        'An Entrepreneur (ESTP) is someone with the Extraverted, Observant, Thinking, and Prospecting personality traits. They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits.',
    'ESFP':
        'An Entertainer (ESFP) is a person with the Extraverted, Observant, Feeling, and Prospecting personality traits. These people love vibrant experiences, engaging in life eagerly and taking pleasure in discovering the unknown. They can be very social, often encouraging others into shared activities.',
  };

  List<List<String>> pairValues = [
    ['Introvert (I)', 'Extrovert (E)'],
    ['Observant (S)', 'Intuitive (N)'],
    ['Thinking (T)', 'Feeling (F)'],
    ['Judging (J)', 'Perceiving (P)']
  ];

  Map<String,String> personalityIconsPath = {

    'ENFJ':'assets/images/personality_icons/enfj-protagonist.png',
    'ENFP':'assets/images/personality_icons/enfp-campaigner.png',
    'ENTJ':'assets/images/personality_icons/entj-commander.png',
    'ENTP':'assets/images/personality_icons/entp-debater.png',
    'ESFJ':'assets/images/personality_icons/esfj-consul.png',
    'ESFP':'assets/images/personality_icons/esfp-entertainer.png',
    'ESTJ':'assets/images/personality_icons/estj-executive.png',
    'ESTP':'assets/images/personality_icons/estp-entrepreneur.png',
    'INFJ':'assets/images/personality_icons/infj-advocate.png',
    'INFP':'assets/images/personality_icons/infp-mediator.png',
    'INTJ':'assets/images/personality_icons/intj-architect.png',
    'INTP':'assets/images/personality_icons/intp-logician.png',
    'ISFJ':'assets/images/personality_icons/isfj-defender.png',
    'ISFP':'assets/images/personality_icons/isfp-adventurer.png',
    'ISTJ':'assets/images/personality_icons/istj-logistician.png',
    'ISTP':'assets/images/personality_icons/istp-virtuoso.png',
};
}
