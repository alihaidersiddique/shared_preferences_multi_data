import 'package:flutter/material.dart';
import 'package:shared_preferences_practice_3/models/model.dart';
import 'package:shared_preferences_practice_3/utils/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _obj = SettingsPreferences();
  final TextEditingController _grabText = TextEditingController();
  var _selectedGender = Gender.Female;
  var _selectedLanguage = Set<ProgrammingLanguage>();
  var _isEmployeed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _obj.retrieveSettings();

    setState(() {
      _grabText.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguage = settings.programmingLanguages;
      _isEmployeed = settings.isEmployeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Settings')),
      body: ListView(children: [
        ListTile(
          title: TextField(
            controller: _grabText,
            decoration: InputDecoration(labelText: 'Username'),
          ),
        ),
        RadioListTile(
            title: Text('Female'),
            value: Gender.Female,
            groupValue: _selectedGender,
            onChanged: (newValue) =>
                setState(() => _selectedGender = newValue as Gender)),
        RadioListTile(
            title: Text('Male'),
            value: Gender.Male,
            groupValue: _selectedGender,
            onChanged: (newValue) =>
                setState(() => _selectedGender = newValue as Gender)),
        RadioListTile(
            title: Text('Other'),
            value: Gender.Other,
            groupValue: _selectedGender,
            onChanged: (newValue) =>
                setState(() => _selectedGender = newValue as Gender)),
        CheckboxListTile(
            title: Text('Dart'),
            value: _selectedLanguage.contains(ProgrammingLanguage.Dart),
            onChanged: (_) {
              setState(() {
                _selectedLanguage.contains(ProgrammingLanguage.Dart)
                    ? _selectedLanguage.remove(ProgrammingLanguage.Dart)
                    : _selectedLanguage.add(ProgrammingLanguage.Dart);
              });
            }),
        CheckboxListTile(
            title: Text('Java'),
            value: _selectedLanguage.contains(ProgrammingLanguage.Java),
            onChanged: (_) {
              setState(() {
                _selectedLanguage.contains(ProgrammingLanguage.Java)
                    ? _selectedLanguage.remove(ProgrammingLanguage.Java)
                    : _selectedLanguage.add(ProgrammingLanguage.Java);
              });
            }),
        CheckboxListTile(
            title: Text('Kotlin'),
            value: _selectedLanguage.contains(ProgrammingLanguage.Kotlin),
            onChanged: (_) {
              setState(() {
                _selectedLanguage.contains(ProgrammingLanguage.Kotlin)
                    ? _selectedLanguage.remove(ProgrammingLanguage.Kotlin)
                    : _selectedLanguage.add(ProgrammingLanguage.Kotlin);
              });
            }),
        CheckboxListTile(
            title: Text('Swift'),
            value: _selectedLanguage.contains(ProgrammingLanguage.Swift),
            onChanged: (_) {
              setState(() {
                _selectedLanguage.contains(ProgrammingLanguage.Swift)
                    ? _selectedLanguage.remove(ProgrammingLanguage.Swift)
                    : _selectedLanguage.add(ProgrammingLanguage.Swift);
              });
            }),
        SwitchListTile(
          title: Text('Is Employed'),
          value: _isEmployeed,
          onChanged: (newValue) => setState(() => _isEmployeed = newValue),
        ),
        TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
      ]),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
      username: _grabText.text,
      gender: _selectedGender,
      programmingLanguages: _selectedLanguage,
      isEmployeed: _isEmployeed,
    );

    _obj.saveSettings(newSettings);
  }
}
