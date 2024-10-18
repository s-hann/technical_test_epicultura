import 'package:dio/dio.dart';
import 'package:technical_test/core/data/model/resource.dart';
import 'package:technical_test/core/data/model/schedule_model.dart';

class RemoteSource {
  RemoteSource({Dio? dio})
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://uat-api.ftlgym.com/api/v1/test',
          ),
        );

  final Dio _dio;

  Future<Resource> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    final resource = Resource.fromJson(
      response.data,
      fromDataT: (_) => null,
    );
    return resource;
  }

  Future<Resource<ScheduleModel>> fetchSchedules() async {
    final response = await _dio.get('/jadwalruangan');
    final resource = Resource.fromJson(
      response.data,
      fromDataT: (json) => ScheduleModel.fromJson(
        json as Map<String, dynamic>,
      ),
    );
    return resource;
  }
}
