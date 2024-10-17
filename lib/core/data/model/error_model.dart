class ErrorModel {
  String? code;
  List<String>? reason;

  ErrorModel({
    this.code,
    this.reason,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json["code"],
        reason: json["reason"] == null
            ? []
            : List<String>.from(json["reason"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "reason":
            reason == null ? [] : List<dynamic>.from(reason!.map((x) => x)),
      };
}
