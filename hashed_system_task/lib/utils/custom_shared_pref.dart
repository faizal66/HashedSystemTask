import 'dart:convert';

import 'package:hashed_system_task/network/response/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {

  static Future<void> saveCustomData(String key, UserData data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(data.toJson()); // Convert custom data to JSON
    await prefs.setString(key, jsonData); // Save JSON string to SharedPreferences
  }

  static Future<UserData?> getCustomData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(key); // Retrieve JSON string from SharedPreferences
    if (jsonData != null) {
      final data = UserData.fromJson(json.decode(jsonData)); // Convert JSON to custom data object
      return data;
    }
    return null;
  }
  static Future<void> clearCustomData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}