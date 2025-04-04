class PainType {
  final int id;
  final String name;

  PainType({
    required this.id,
    required this.name,
  });

  factory PainType.fromJson(Map<String, dynamic> json) {
    return PainType(
      id: json['id'] ?? 0, // مقدار پیش‌فرض 0 اگر null باشد
      name: json['name'] ?? '', // مقدار پیش‌فرض رشته خالی
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}