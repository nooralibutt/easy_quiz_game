# Easy Quiz Game

[![pub package](https://img.shields.io/pub/v/easy_quiz_game.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/easy_quiz_game)
[![Last Commits](https://img.shields.io/github/last-commit/nooralibutt/easy_quiz_game?logo=git&logoColor=white)](https://github.com/nooralibutt/easy_quiz_game/commits/master)
[![Pull Requests](https://img.shields.io/github/issues-pr/nooralibutt/easy_quiz_game?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_quiz_game/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/nooralibutt/easy_quiz_game?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_quiz_game)
[![License](https://img.shields.io/github/license/nooralibutt/easy_quiz_game?logo=open-source-initiative&logoColor=green)](https://github.com/nooralibutt/easy_quiz_game/blob/master/LICENSE)

**Show some 💙, 👍 the package & ⭐️ the repo to support the project**

## Features
- Image Questions
- Asset and Network Images
- Easily Implement ads inside

## How to use
There are two ways to use Easy Quiz Game.

### 1: Stand-Alone App mode

```dart
 Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => Scaffold(body: EasyQuizGameApp(
      quizCategories: data,
      primaryColor: Theme.of(context).primaryColor,
      menuLogoPath: 'assets/images/logo.png',
      buttonPath: 'assets/images/primary_button.png',
      labelPath: 'assets/images/label.png',
      bgImagePath: 'assets/images/bg.png',
      gradient: LinearGradient(
        stops: const [0, 1],
        begin: const Alignment(1, -1),
        end: const Alignment(0, 1),
        colors: [Theme.of(context).primaryColor, const Color(0xff753bc6)],
      ),
      secondaryColor: const Color(0xff753bc6),
    ))),
    );
```

### 2: Add to Widget-Tree

```dart
    EasyQuizGameApp(
      quizCategories: data,
      primaryColor: Theme.of(context).primaryColor,
      menuLogoPath: 'assets/images/logo.png',
      buttonPath: 'assets/images/primary_button.png',
      labelPath: 'assets/images/label.png',
      bgImagePath: 'assets/images/bg.png',
      gradient: LinearGradient(
        stops: const [0, 1],
        begin: const Alignment(1, -1),
        end: const Alignment(0, 1),
        colors: [Theme.of(context).primaryColor, const Color(0xff753bc6)],
      ),
      secondaryColor: const Color(0xff753bc6),
    )
```

## Requirements
### Android:
- Enable Multidex in the `app/build.gradle` file

```
defaultConfig {
    multiDexEnabled true
}
```
Also add dependencies
```
dependencies {
    implementation 'com.android.support:multidex:1.0.3'
}
```

### iOS
- edit your `ios/Podfile` as follows:

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    
    # ADD THE NEXT SECTION
    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',
        'AUDIO_SESSION_MICROPHONE=0'
      ]
    end
  end
end
```
## Additional Info

### Data Model
Prepare model list and pass it to the `EasyQuizGameApp()` widget.

```dart
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
```

See [Example](https://pub.dev/packages/easy_quiz_game/example) for better understanding.

## Authors
##### Noor Ali Butt
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/nooralibutt) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/nooralibutt)
##### Hanzla Waheed
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/mhanzla80) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/mhanzla80)