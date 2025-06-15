import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/shared_widgets/loading_indicator.dart';
import '../../manager/cubits/task_list_cubit.dart';
import '../../data/states/task_list_state.dart';
import '../../view/widgets/add_task_bar.dart';
import '../../view/widgets/task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: SafeArea(
        child: Column(
          children: const [
            Padding(padding: EdgeInsets.all(8.0), child: AddTaskBar()),
            Expanded(child: _TaskListBody()),
          ],
        ),
      ),
    );
  }
}

class _TaskListBody extends StatelessWidget {
  const _TaskListBody();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        if (state is TaskListLoading) return const LoadingIndicator();
        if (state is TaskListLoaded) {
          if (state.tasks.isEmpty) {
            return const Center(child: Text('No tasks yet'));
          }
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (ctx, i) => TaskTile(task: state.tasks[i]),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
