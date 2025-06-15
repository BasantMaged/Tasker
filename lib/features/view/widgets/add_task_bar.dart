import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/shared_widgets/app_button.dart';
import 'package:tasker/shared_widgets/app_text_field.dart';
import '../../manager/cubits/add_task_cubit.dart';
import '../../data/states/add_task_state.dart';

class AddTaskBar extends StatefulWidget {
  const AddTaskBar({super.key});
  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) controller.clear();
      },
      child: Row(
        children: [
          Expanded(
            child: AppTextField(controller: controller, hint: 'Enter task'),
          ),
          const SizedBox(width: 8),
          AppButton(
            label: 'Add',
            onTap: () => context.read<AddTaskCubit>().add(controller.text),
          ),
        ],
      ),
    );
  }
}
