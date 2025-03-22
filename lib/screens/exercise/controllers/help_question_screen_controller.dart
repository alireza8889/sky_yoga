import 'package:get/get.dart';
import 'package:skyyoga/screens/exercise/models/help_question_model.dart';
import 'package:skyyoga/screens/exercise/models/help_question_option_model.dart';

class HelpQuestionScreenController extends GetxController {
  RxList<HelpQuestionModel> helpQuestionItemList = <HelpQuestionModel>[
    HelpQuestionModel(
        question: 'Tell us what you can do and we will help you to grow ',
        options: [
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 1),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 2),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 3),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 4),
        ]),
    HelpQuestionModel(
        question: 'Tell us what you can do and we will help you to grow ',
        options: [
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 1),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 2),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 3),
          HelpQuestionOptionModel(imageUrl: 'imageUrl', id: 4),
        ]),
  ].obs;

  Future<void> getAllHelpQuestion() async {}

  @override
  void onInit() {
    // TODO: implement onInit
    getAllHelpQuestion();
    super.onInit();
  }
}
