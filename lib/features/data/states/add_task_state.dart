abstract class AddTaskState {}

class AddTaskIdle extends AddTaskState {}

class AddingTask extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskError extends AddTaskState {
  final String message;
  AddTaskError(this.message);
}
