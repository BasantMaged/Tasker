import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/states/complete_task_state.dart';
import '../../data/models/task_model.dart';
import '../repositories/local_task_repository.dart';
import 'task_list_cubit.dart';

class CompleteTaskCubit extends Cubit<CompleteTaskState> {
  final LocalTaskRepository repo;
  final TaskListCubit listCubit;
  CompleteTaskCubit(this.repo, this.listCubit) : super(CompleteTaskIdle());

  Future<void> toggle(String id) async {
    emit(TogglingTask());
    final tasks = await repo.fetchTasks();
    final updated =
        tasks
            .map(
              (t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t,
            )
            .toList();
    await repo.saveTasks(updated);
    await listCubit.refresh();
    emit(CompleteTaskSuccess());
    emit(CompleteTaskIdle());
  }
}
