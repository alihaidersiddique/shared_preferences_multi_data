import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_practice_3/models/model.dart';

class SettingsPreferences {
  Future saveSettings(Settings settings) async {
    final _preferences = await SharedPreferences.getInstance();

    await _preferences.setString('username', settings.username);
    await _preferences.setBool('isEmployeed', settings.isEmployeed);
    await _preferences.setInt('gender', settings.gender.index);
    await _preferences.setStringList(
        'programmingLanguages',
        settings.programmingLanguages
            .map((lang) => lang.index.toString())
            .toList());

    print('Settings Saved !');
  }

  Future<Settings> retrieveSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployeed = preferences.getBool('isEmployeed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final programmingLanguagesIndicies =
        preferences.getStringList('programmingLanguages');

    final programmingLanguages = programmingLanguagesIndicies!
        .map(
            (stringIndex) => ProgrammingLanguage.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
        username: username!,
        gender: gender,
        programmingLanguages: programmingLanguages,
        isEmployeed: isEmployeed!);
  }
}
