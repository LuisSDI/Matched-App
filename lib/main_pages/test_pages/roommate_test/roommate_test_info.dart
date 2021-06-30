class RoommateTestInfo {
  List<String> habitsQuestions = [
    "How do you feel about your roommate's friends spending time in your room?",
    'How do you feel about groups of people socializing in your room?',
    'Which statement best describes your standards for the condition of your room?',
    'Which statement best describes you?',
    'Which statement best describes your preference of study environment in your room?',
    'How would you feel about your roommate borrowing/sharing your personal belongings?',
    'Residence halls are composed of a wide variety of individuals from different nationalities, races, sexual orientation and cultural and religious backgrounds. The people living around you have a multitude of characteristics and values. How do you feel about living in this type of situation?',
    'The University prohibits the use of smoking when in violation of the state law; however your attitude on cigarettes use is very important. How would you describe your attitude toward smoking?',
    'I usually wake up:',
    'I consider myself a:',
    'My ideal room temperature is:',
    'Do bills get split in half or based upon usage?',
    'Do you prefer set quiet times, sometimes I am good with some noise, or figure it out as we go?',
    'Do you plan to be around most weekends?',
    'Do you party frequently, an average amount, seldom, never?',
    'Should household chores be assigned, done mutually, done by whoever thinks to do them?',
    'Are you more comfortable when you are by yourself or when you socialize with other people?',
    'What kind of relationship are you looking for in a roommate?',
    'When dealing with conflicts...'
  ];

  Map<int, List<String>> habitsAnswers = {
    0: [
      'I would usually be comfortable in this situation.',
      'I would usually agree if I didn’t plan to be there.',
      'Only if my roommate asked and I agreed.',
      'No Way!',
    ],
    1: [
      'This would be fine with me most of the time.',
      'This would be fine occasionally.',
      'It would be okay only if I didn’t plan to be there.',
      'I would expect to find privacy in my room most of the time.',
    ],
    2: [
      'I like my room to be immaculate.',
      'I like my room to be generally neat but am willing to put up with a little bit of disorder from time to time.',
      'It does not bother me if my room is a bit dirty and disorganized.',
    ],
    3: [
      'I am a morning person and prefer to live with a morning person.',
      'I am a morning person but can live with a night person.',
      'I am a night person and prefer to live with a night person.',
      'I am a night person but can live with a morning person.',
    ],
    4: [
      'I prefer a study environment that is very quiet.',
      'I prefer a study environment with some noise (e.g., music, TV, etc.) in the background.',
      'I can study regardless of the noise level.',
    ],
    5: [
      'I would not mind at all.',
      'I would not mind sharing things like computers, TVs, stereos, etc., but would mind sharing personal items like clothing.',
      'I would not mind if I had been asked and had given my permission.',
      'I would not use other people’s things and expect others not to use mine.',
    ],
    6: [
      'It’s really exciting!',
      'I like it.',
      'I can tolerate it.',
      'I am not comfortable with it.',
    ],
    7: [
      'Very approving of its use.',
      'Accepting, if it is used occasionally.',
      'Tolerant, if it is not used in my presence.',
      'I do not tolerate its use.',
    ],
    8: [
      'Before 8am',
      '8am-10am',
      '10am-12am',
      'After 12pm',
    ],
    9: [
      'Light Sleeper',
      'Heavy Sleeper',
    ],
    10: [
      'Below 18°C',
      '18°C - 21°C',
      '21°C - 24°C',
      'Above 24°C',
    ],
    11: [
      'Bills should be split in half',
      'The bills should be split based upon usage',
    ],
    12: [
      'I would prefer to set quiet times in my dorm.',
      'I am okay with having some noise in the room sometimes.',
      'I guess it will depend on a case by case basis, and figure it out as we go.',
    ],
    13: [
      'I plan to stay in my dorm almost every weekend.',
      'I plan to rarely leave my dorm during the weekend.',
      'I plan to sometimes be in the dorm during the weekends and sometimes go out during the weekend.',
      'I would often go out during the weekend.',
      'I plan to go out almost every weekend.',
    ],
    14: [
      'I never go to parties',
      'I seldom go to parties',
      'Sometimes I go to parties',
      'I usually go to parties',
    ],
    15: [
      'I think household chores should be assigned to each roommate.',
      'I think household chores should be done working mutually.',
      'I think household chores should be done whenever someone feels like it.',
    ],
    16: [
      'I am a more comfortable when I am by myself.',
      'I somewhere in between both options.',
      'I am more comfortable when I socialize with other people.',
    ],
    17: [
      'To do everything together',
      'To be friends',
      'To be respectful and peacefully coexist',
    ],
    18: [
      'I am able to clearly express my feelings and concerns',
      'I will generally express my concerns in a joking fashion so that the other person gets the hint',
      'I am not comfortable asserting myself in conflict',
    ]
  };

  List<String> socialQuestion = [
    '1. I prefer to be with other people rather than be by myself.',
    '2. At social event I like to talk with many people.',
    '3. I like to meet new people and make new friends.',
    '4. I prefer to have a lot of friends.',
    '5. I find it easy to talk to strangers.',
    '6. I like getting phone calls.',
    '7. I prefer doing social activities (go to parties, dancing, hangout with friends) rather than individual activities (reading a book, meditate, write).',
    '8. I like to attend parties and social events.',
    '9. I am easy to approach and talk freely.'
  ];

  List<String> interestAnswers = [
    'Never',
    'Rarely',
    'Sometimes',
    'Often',
    'Very Often'
  ];

  List<String> beliefQuestion = [
    '1. I consider myself a religious person.',
    '2. It is important that my roommate have similar beliefs or opinions.',
    '3. I believe there are many ways of believing in God/Gods and showing my faith.',
    '4. I like to talk about my beliefs with others.',
    '5. How often do you pray and/or practice your faith?',
    '6. Religion is an important aspect of my life.',
    '7. I enjoy learning about others beliefs.'
  ];

  List<String> communicationsQuestion = [
    "1. It's easy for me to express my feelings.",
    '2. I settle disputes calmly and without argument.',
    '3. I am open minded and willing to change.',
    '4. I am an optimistic person.',
    '5. I am a good listener.',
    '6. I control my temper.',
    '7. When I\'m stressed I choose to be alone.',
    '8. I like to share my thoughts and feelings with other people.',
    '9. I am good starting conversations.'
  ];

  List<String> activitiesQuestion = [
    '1. I enjoy watching sports.',
    "2. I'm into exercise, fitness and/or sports.",
    '3. I enjoy watching movies and/or the TV shows.',
    '4. I enjoy art and it various expressions.',
    '5. I enjoy playing music and/or dancing.',
    '6. I enjoy dancing',
    '7. I enjoy playing videogames or watching gameplays',
    '8. I enjoy talking about science and technology.',
    '9. I like to cook and try new dishes.',
    '10. I enjoy to go shopping.',
    '11. I like to attend and/or give parties.',
    '12. I enjoy talking about fashion.'
  ];
}
