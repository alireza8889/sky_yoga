import 'help_question_option_model.dart';

class HelpQuestionModel{
  final List<HelpQuestionOptionModel> options;

  HelpQuestionModel({required this.options,});

  factory HelpQuestionModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    return HelpQuestionModel(
      options: data['video_id'] ?? '',
    );
  }

}