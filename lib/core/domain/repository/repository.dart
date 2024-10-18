import 'package:dartz/dartz.dart';
import 'package:technical_test/core/data/source/remote_source.dart';
import 'package:technical_test/core/domain/entity/schedule_entity.dart';

class Repository {
  final _source = RemoteSource();

  Future<Either<String, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _source.login(email: email, password: password);
      if (result.error != null) {
        return Left('${result.error?.reason?[0]}');
      }
      return Right(result.message == 'success');
    } catch (e) {
      return Left('$e');
    }
  }

  Future<Either<String, List<ScheduleEntity>>> fetchSchedules() async {
    try {
      final result = await _source.fetchSchedules();
      if (result.error != null) {
        return Left('${result.error?.reason?[0]}');
      }
      final schedules = <ScheduleEntity>[];
      for (final schedule in result.data!) {
        final entity = ScheduleEntity(
          time: '${schedule.waktuMulai} - ${schedule.waktuSelesai}',
          roomName: '${schedule.namaRuangan}',
        );
        schedules.add(entity);
      }
      return Right(schedules);
    } catch (e) {
      return Left('$e');
    }
  }
}
