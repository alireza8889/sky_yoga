class UserProfileModel {
  final String name;
  final String gender;
  final String location;
  final List<String> mainFocuses;

  UserProfileModel({
    required this.name,
    required this.gender,
    required this.location,
    required this.mainFocuses,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'location': location,
        'main_focuses': mainFocuses,
      };
}