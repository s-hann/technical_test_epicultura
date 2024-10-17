import 'package:dartz/dartz.dart';
import 'package:technical_test/core/data/source/remote_source.dart';

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
      print('error $e');
      return Left('$e');
    }
  }
}
