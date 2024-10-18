part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.schedules = const <ScheduleEntity>[],
  });

  final Status status;
  final List<ScheduleEntity> schedules;

  HomeState copyWith({
    Status? status,
    List<ScheduleEntity>? schedules,
  }) {
    return HomeState(
      status: status ?? this.status,
      schedules: schedules ?? this.schedules,
    );
  }

  @override
  List<Object> get props => [status, schedules];
}
