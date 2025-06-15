abstract class CompleteTaskState {}

class CompleteTaskIdle extends CompleteTaskState {}

class TogglingTask extends CompleteTaskState {}

class CompleteTaskSuccess extends CompleteTaskState {}

class CompleteTaskError extends CompleteTaskState {
  final String message;
  CompleteTaskError(this.message);
}
