enum Gender { Female, Male, Other }

enum ProgrammingLanguage { Dart, Java, Kotlin, Swift }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguages;
  final bool isEmployeed;

  Settings({
    required this.username,
    required this.gender,
    required this.programmingLanguages,
    required this.isEmployeed,
  });
}
