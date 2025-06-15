abstract class DeleteTaskState {}

class DeleteTaskIdle extends DeleteTaskState {}

class DeletingTask extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {}

class DeleteTaskError extends DeleteTaskState {
  final String message;
  DeleteTaskError(this.message);
}
