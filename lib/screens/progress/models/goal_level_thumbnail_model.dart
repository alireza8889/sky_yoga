class GoalLevelThumbNailModel{
  final String imageUrl;
  final String levelStatus;
  final int levelNumber;
  GoalLevelThumbNailModel( {required this.imageUrl,required this.levelStatus,required this.levelNumber});
}
enum GoalLevelStatus {
  passed,
  inProcess,
  locked,
}
