import 'dart:convert';

ReminderApiResponse reminderApiResponseFromJson(String str) =>
    ReminderApiResponse.fromJson(json.decode(str));

String reminderApiResponseToJson(ReminderApiResponse data) =>
    json.encode(data.toJson());

class ReminderApiResponse {
  final List<Reminder> data;
  final String message;

  ReminderApiResponse({
    required this.data,
    required this.message,
  });

  factory ReminderApiResponse.fromJson(Map<String, dynamic> json) =>
      ReminderApiResponse(
        data:
            List<Reminder>.from(json["data"].map((x) => Reminder.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Reminder {
  final int id;
  final int user;
  final List<int> daysOfWeek;
  final String time;
  final String message;
  final bool isActive;
  final DateTime createdAt;

  Reminder({
    required this.id,
    required this.user,
    required this.daysOfWeek,
    required this.time,
    required this.message,
    required this.isActive,
    required this.createdAt,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        id: json["id"],
        user: json["user"],
        daysOfWeek: List<int>.from(json["days_of_week"].map((x) => x)),
        time: json["time"],
        message: json["message"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "days_of_week": List<dynamic>.from(daysOfWeek.map((x) => x)),
        "time": time,
        "message": message,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
      };

  Reminder copyWith({
    int? id,
    int? user,
    List<int>? daysOfWeek,
    String? time,
    String? message,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Reminder(
      id: id ?? this.id,
      user: user ?? this.user,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      time: time ?? this.time,
      message: message ?? this.message,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
