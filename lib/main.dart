import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/them/app_them.dart';
import 'package:tasker/features/manager/cubits/add_task_cubit.dart';
import 'package:tasker/features/manager/cubits/complete_task_cubit.dart';
import 'package:tasker/features/manager/cubits/delete_task_cubit.dart';
import 'package:tasker/features/manager/cubits/task_list_cubit.dart';
import 'package:tasker/features/manager/repositories/local_task_repository.dart';
import 'package:tasker/features/view/pages/task_list_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = LocalTaskRepository();
  final taskListCubit = TaskListCubit(repository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: taskListCubit),
        BlocProvider(create: (_) => AddTaskCubit(repository, taskListCubit)),
        BlocProvider(create: (_) => DeleteTaskCubit(repository, taskListCubit)),
        BlocProvider(
          create: (_) => CompleteTaskCubit(repository, taskListCubit),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasker',
      theme: AppTheme.light,
      home: const TaskListView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
