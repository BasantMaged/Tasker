import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubits/delete_task_cubit.dart';

class DeleteTaskButton extends StatelessWidget {
  final String id;
  const DeleteTaskButton({super.key, required this.id});
  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.delete, color: Colors.red),
    onPressed: () => context.read<DeleteTaskCubit>().delete(id),
  );
}
