class Mood {
  final String value;
  final String displayName;

  Mood({required this.value, required this.displayName});

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      value: json['value'],
      displayName: json['display_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'display_name': displayName,
    };
  }
}