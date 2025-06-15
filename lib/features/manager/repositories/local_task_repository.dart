import '../../data/local_storage_service.dart';
import '../../data/models/task_model.dart';

class LocalTaskRepository {
  final LocalStorageService _storage = LocalStorageService();

  Future<List<TaskModel>> fetchTasks() async {
    final raw = await _storage.readTasks();
    return raw.map(TaskModel.fromJson).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    await _storage.writeTasks(tasks.map((e) => e.toJson()).toList());
  }
}
