import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubits/complete_task_cubit.dart';

class CompleteCheckbox extends StatelessWidget {
  final bool value;
  final String id;
  const CompleteCheckbox({super.key, required this.value, required this.id});
  @override
  Widget build(BuildContext context) => Checkbox(
    value: value,
    activeColor: const Color(0xFF008080),
    onChanged: (_) => context.read<CompleteTaskCubit>().toggle(id),
  );
}
