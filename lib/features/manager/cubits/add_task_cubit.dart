import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/utils/uuid_helper.dart';
import '../../data/states/add_task_state.dart';
import '../../data/models/task_model.dart';
import '../repositories/local_task_repository.dart';
import 'task_list_cubit.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final LocalTaskRepository repo;
  final TaskListCubit listCubit;
  AddTaskCubit(this.repo, this.listCubit) : super(AddTaskIdle());

  Future<void> add(String title) async {
    if (title.trim().isEmpty) {
      emit(AddTaskError('Task cannot be empty'));
      emit(AddTaskIdle());
      return;
    }
    emit(AddingTask());
    final tasks = await repo.fetchTasks();
    tasks.add(TaskModel(id: UuidHelper.v4(), title: title));
    await repo.saveTasks(tasks);
    await listCubit.refresh();
    emit(AddTaskSuccess());
    emit(AddTaskIdle());
  }
}
