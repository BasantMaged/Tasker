import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/states/delete_task_state.dart';
import '../repositories/local_task_repository.dart';
import 'task_list_cubit.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final LocalTaskRepository repo;
  final TaskListCubit listCubit;
  DeleteTaskCubit(this.repo, this.listCubit) : super(DeleteTaskIdle());

  Future<void> delete(String id) async {
    emit(DeletingTask());
    final tasks = await repo.fetchTasks();
    tasks.removeWhere((t) => t.id == id);
    await repo.saveTasks(tasks);
    await listCubit.refresh();
    emit(DeleteTaskSuccess());
    emit(DeleteTaskIdle());
  }
}
