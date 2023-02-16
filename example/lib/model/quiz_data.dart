import 'package:easy_quiz_game/easy_quiz_game.dart';

final data = [
  QuizCategory(
    name: 'Animated Movies',
    description: 'This Quiz is About Animated Movies',
    iconImage: 'assets/images/animated movies.jpg',
    difficulty: QuizDifficulty.beginner,
    quizzes: [
      Quiz(
          question:
              'What does the main character of Up use to make his house float?',
          options: ['Magnets', 'Jets', 'Magic', 'Balloons'],
          correctIndex: 3,
          hint: 'I believe it is either Magnets or Balloons',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.medium),
      Quiz(
          question: 'What animated movie is about insects?',
          options: ['Kung Fu Panda', 'The Iron Giant', 'Antz', 'Cats & Dogs'],
          correctIndex: 2,
          hint: 'I believe it is either Antz or Cats & Dogs',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.medium),
      Quiz(
          question:
              'Which animated film features an elephant as the main character?',
          options: ['Shrek', 'The Little Mermaid', 'Kung Fu Panda', 'Dumbo'],
          correctIndex: 3,
          hint: 'I believe it is either Dumbo or The Little Mermaid',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.medium),
      Quiz(
          question:
              'Jack Black voices a Panda in which of the following animated movies?',
          options: ['Spirited Away', 'Coco', 'Kung Fu Panda', 'Frozen'],
          correctIndex: 2,
          hint: 'I believe it is either Kung Fu Panda or Frozen',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.medium),
    ],
  ),
  QuizCategory(
    name: 'Food',
    description: 'This Quiz is About to get information of Foods',
    iconImage: 'assets/images/food.png',
    difficulty: QuizDifficulty.easy,
    quizzes: [
      Quiz(
          question: 'Which food item is considered a healthy snack?',
          options: ['Popsicle', 'Cookies', 'Apple', 'Potato Chips'],
          correctIndex: 3,
          hint: 'I believe it is either Apple or Potato Chips',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'What is the sweet substance made by bees?',
          options: ['Honey', 'Orange Juicer', 'Vanilla', 'Tapioca'],
          correctIndex: 0,
          hint: 'I believe it is either Tapioca or Honey',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'What is the most common fruit used to produce wine?',
          options: ['Cherry', 'Pear', 'Grape', 'Plum'],
          correctIndex: 2,
          hint: 'I believe it is either Cherry or Grape',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'Which appliance is used for cooking?',
          options: ['Microwave', 'Dishwasher', 'Washing Machine', 'Iron'],
          correctIndex: 2,
          hint: 'I believe it is either Microwave or Dishwasher',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'Which of these is a breakfast food staple?',
          options: ['Ice Cream', 'Green beans', 'Spaghetti', 'Eggs'],
          correctIndex: 3,
          hint: 'I believe it is either Spaghetti or Eggs',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.easy),
    ],
  ),
  QuizCategory(
    name: 'Romance',
    description: 'This Quiz is About to get information of Love',
    iconImage: 'assets/images/Love.png',
    difficulty: QuizDifficulty.easy,
    quizzes: [
      Quiz(
          question: 'assets/images/love 1.jpg',
          options: [
            'Iron Man',
            'Spider Man',
            'Batman Begins',
            'Captain Marvel'
          ],
          correctIndex: 1,
          hint: 'I believe it is either Spider Man or Batman Begins',
          questionType: QuizQuestionType.image,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'assets/images/love 2.jpg',
          options: [
            'The Wedding Singer',
            'Happy Gilmore',
            'Billy Maddison',
            'Big Daddy'
          ],
          correctIndex: 0,
          hint: 'I believe it is either The Wedding Singer or Big Daddy',
          questionType: QuizQuestionType.image,
          difficulty: QuizDifficulty.easy),
      Quiz(
          question: 'What animated movie is about insects?',
          options: ['Kung Fu Panda', 'The Iron Giant', 'Antz', 'Cats & Dogs'],
          correctIndex: 2,
          hint: 'I believe it is either Antz or Cats & Dogs',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.medium),
    ],
  ),
  QuizCategory(
    name: 'Animals',
    description: 'This Quiz is About to get information of Animals',
    iconImage: 'assets/images/animals.png',
    difficulty: QuizDifficulty.easy,
    quizzes: [
      Quiz(
          question: 'assets/images/bear.jpg',
          options: ['Hyenas', 'grizzly bear', 'Polar bear', 'Giant Pandas'],
          correctIndex: 1,
          hint: 'All I can say is that it is definitely not Hyenas',
          questionType: QuizQuestionType.image,
          difficulty: QuizDifficulty.hard),
      Quiz(
          question: 'What prickly animal has needle_like quills on its body?',
          options: [
            'Stingray',
            'Hammerhead Shark',
            'Yellowjacket',
            'Porcupine'
          ],
          correctIndex: 0,
          hint: 'I believe it is either Stingray or Porcupine',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.hard),
      Quiz(
          question:
              'Which of these is a large animal that stays in the water a lot?',
          options: ['Toad', 'Hippopotamus', 'Bald Eagle', 'Nightingale'],
          correctIndex: 1,
          hint: 'I believe it is either Hippopotamus or Nightingale',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.hard),
      Quiz(
          question: 'What is the largest mammal in the world?',
          options: ['Sea lion', 'Blue Whale', 'Rhinoceros', 'Bear'],
          correctIndex: 1,
          hint: 'I believe it is either Rhinoceros or Blue Whale',
          questionType: QuizQuestionType.text,
          difficulty: QuizDifficulty.hard),
    ],
  ),
];
