class GoalLevelThumbNailModel{
  int id;
  int video;
  String category;
  String thumbnail;
  bool isDone;
  String doneAt;
  String createdAt;
  GoalLevelThumbNailModel( {required this.id,
    required this.video,
    required this.category,
    required this.thumbnail,
    required this.isDone,
    required this.doneAt,
    required this.createdAt,});

  factory GoalLevelThumbNailModel.fromJson(Map<String, dynamic> json) {
    return GoalLevelThumbNailModel(
      id: json['id'],
      video: json['video'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      isDone: json['is_done'],
      doneAt: json['done_at'],
      createdAt: json['created_at'],
    );
  }
}
enum GoalLevelStatus {
  passed,
  inProcess,
  locked,
}
