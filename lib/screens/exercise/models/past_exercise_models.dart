import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PastExerciseModel{
  final int id;
 final int videoSequence;
  final int sequenceLength;
 final double duration;
 final String thumbnail;
 final String title;
 final String description;
  final int watchedNumber;
  bool isComplete;
  RxBool isLiked;



  PastExerciseModel( {
    required this.isLiked,
   required this.thumbnail,
    required this.title,
    required this.id,
    required this.videoSequence,
    required this.sequenceLength,
    required this.duration,
    required this.description,
    required this.watchedNumber,
    required this.isComplete,});




  factory PastExerciseModel.fromJson(Map<String, dynamic> json) {

    return PastExerciseModel(
      id: json['id'],
      videoSequence: json['video_sequence'],
      sequenceLength: json['sequence_length'],
      duration: json['duration'],
      description: json['description'],
      watchedNumber: json['watched_number'],
      isComplete: json['is_complete'], isLiked: false.obs,
      thumbnail: json['thumbnail'],
      title: json['title'],
    );
  }

}