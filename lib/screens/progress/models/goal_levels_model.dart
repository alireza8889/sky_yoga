import 'package:skyyoga/screens/progress/models/goal_level_thumbnail_model.dart';

class GoalLevelsModel{
  final String label;
  final List<GoalLevelThumbNailModel> goalLevels;

  GoalLevelsModel({required this.label,required this.goalLevels});


  factory GoalLevelsModel.fromJson(Map<String, dynamic> json) {
    return GoalLevelsModel(
      label: json['label'],
      goalLevels: (json['goal_levels'] as List)
          .map((goalLevelJson) => GoalLevelThumbNailModel.fromJson(goalLevelJson))
          .toList(),
    );
  }
}