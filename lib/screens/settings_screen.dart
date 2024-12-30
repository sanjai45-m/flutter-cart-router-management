import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  String _selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
      _selectedCurrency = prefs.getString('currency') ?? 'USD';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
    await prefs.setBool('notifications', _notificationsEnabled);
    await prefs.setString('currency', _selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark theme'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
                _saveSettings();
              });
            },
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable push notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
                _saveSettings();
              });
            },
          ),
          ListTile(
            title: const Text('Currency'),
            subtitle: Text(_selectedCurrency),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {
                  _selectedCurrency = value;
                  _saveSettings();
                });
              },
              itemBuilder: (BuildContext context) {
                return ['USD', 'EUR', 'GBP', 'JPY']
                    .map((String currency) => PopupMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        ))
                    .toList();
              },
            ),
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('App version 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Shopping App',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 Shopping App',
              );
            },
          ),
        ],
      ),
    );
  }
}