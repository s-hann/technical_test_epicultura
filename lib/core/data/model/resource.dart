import 'package:technical_test/core/data/model/error_model.dart';

class Resource<T> {
  Resource({
    this.status,
    this.message,
    this.timestamp,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  DateTime? timestamp;
  ErrorModel? error;
  List<T>? data;

  factory Resource.fromJson(
    Map<String, dynamic> json, {
    required T Function(Object? json) fromDataT,
  }) =>
      Resource<T>(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        error:
            json["error"] == null ? null : ErrorModel.fromJson(json["error"]),
        data: json["data"] == null
            ? null
            : json["data"] == []
                ? null
                : (json["data"] as List<dynamic>)
                    .map((item) => fromDataT(item))
                    .toList(),
      );
}
