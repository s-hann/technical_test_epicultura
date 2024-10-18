import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/core/domain/entity/schedule_entity.dart';
import 'package:technical_test/core/domain/repository/repository.dart';
import 'package:technical_test/core/enum/status_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<FetchSchedules>(_fetchSchedules);
    add(FetchSchedules());
  }

  final _repository = Repository();

  Future<void> _fetchSchedules(
    FetchSchedules event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await _repository.fetchSchedules();
    response.fold(
      (failed) {
        emit(state.copyWith(status: Status.failure));
      },
      (schedules) {
        emit(
          state.copyWith(
            status: Status.success,
            schedules: schedules,
          ),
        );
      },
    );
  }
}
