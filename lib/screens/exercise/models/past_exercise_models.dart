class PastExerciseModel{
  final String imageUrl;
  final String title;
  final String description;
  final int time;
  final String number;
  final int completedClass;
  final int allClass;
  final bool isLiked;



  PastExerciseModel( {required this.isLiked,required this.imageUrl,required this.title,required this.description,required this.number,required this.time,required this.completedClass,required this.allClass});
}