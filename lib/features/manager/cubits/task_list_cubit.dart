import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/states/task_list_state.dart';
import '../../data/models/task_model.dart';
import '../repositories/local_task_repository.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final LocalTaskRepository repo;
  TaskListCubit(this.repo) : super(TaskListLoading()) {
    refresh();
  }

  Future<void> refresh() async {
    emit(TaskListLoading());
    final tasks = await repo.fetchTasks();
    emit(TaskListLoaded(tasks));
  }

  Future<void> save(List<TaskModel> tasks) async {
    await repo.saveTasks(tasks);
    emit(TaskListLoaded(tasks));
  }
}
