import '../models/task_model.dart';

abstract class TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListLoaded extends TaskListState {
  final List<TaskModel> tasks;
  TaskListLoaded(this.tasks);
}
