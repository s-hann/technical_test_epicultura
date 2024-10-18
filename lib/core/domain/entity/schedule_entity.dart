import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  const ScheduleEntity({
    required this.time,
    required this.roomName,
  });

  final String time;
  final String roomName;

  ScheduleEntity copyWith({
    String? time,
    String? roomName,
  }) {
    return ScheduleEntity(
      time: time ?? this.time,
      roomName: roomName ?? this.roomName,
    );
  }

  @override
  List<Object> get props => [time, roomName];
}
