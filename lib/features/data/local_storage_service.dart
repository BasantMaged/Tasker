import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _taskKey = 'task_list';

  Future<List<Map<String, dynamic>>> readTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_taskKey);
    if (raw == null) return [];
    final List decoded = jsonDecode(raw);
    return decoded.cast<Map<String, dynamic>>();
  }

  Future<void> writeTasks(List<Map<String, dynamic>> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(tasks);
    await prefs.setString(_taskKey, encoded);
  }
}
