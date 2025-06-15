import 'package:flutter/material.dart';
import 'package:tasker/utils/constants.dart';
import '../../data/models/task_model.dart';
import 'complete_checkbox.dart';
import 'delete_task_button.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CompleteCheckbox(value: task.isCompleted, id: task.id),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 16,
          color: task.isCompleted ? AppColors.teal : AppColors.charcoal,
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: DeleteTaskButton(id: task.id),
    );
  }
}
