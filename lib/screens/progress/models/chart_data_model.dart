class ChartDataModel {
  ChartDataModel({
    required this.flexibility,
    required this.strength,
    required this.balance,
    required this.endurance,
    required this.consistency,
    required this.mindfulness,
  });

  final double flexibility;
  final double strength;
  final double balance;
  final double endurance;
  final double consistency;
  final double mindfulness;

  factory ChartDataModel.fromJson(Map<String, dynamic> json) {
    return ChartDataModel(
      flexibility: double.parse(json['flexibility']) * 10,
      strength: double.parse(json['strength']) * 10,
      balance: double.parse(json['balance']) * 10,
      endurance: double.parse(json['endurance']) * 10,
      consistency: double.parse(json['consistency']) * 10,
      mindfulness: double.parse(json['mindfulness']) * 10,
    );
  }
}