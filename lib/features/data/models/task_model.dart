class TaskModel {
  final String id;
  final String title;
  final bool isCompleted;

  const TaskModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  TaskModel copyWith({bool? isCompleted}) => TaskModel(
    id: id,
    title: title,
    isCompleted: isCompleted ?? this.isCompleted,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'] as String,
    title: json['title'] as String,
    isCompleted: json['isCompleted'] as bool,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };
}
