import 'package:apex_mobile/src/app/data/model/fit.dart';
import 'package:apex_mobile/src/config/logging_interceptor.dart';
import 'package:dio/dio.dart';

final class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://da93-31-171-108-18.ngrok-free.app/api/v1',
    ),
  )..interceptors.add(LoggingInterceptor());

  static final Dio _fitDio = Dio(
    BaseOptions(
      baseUrl: 'https://v1.nocodeapi.com/kazimovzaman2/fit',
    ),
  )..interceptors.add(LoggingInterceptor());

  Dio get instance => _dio;

  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

  /// Get fit data from the server
  Future<Fit> getFitData() async {
    try {
      final response = await _fitDio.get(
        '/TjEAjVEWIocFULJG/aggregatesDatasets?dataTypeName=steps_count,active_minutes,calories_expended,heart_minutes,sleep_segment,weight,activity_summary',
      );
      return Fit.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    }
  }

  /// Get message from the server
  Future<String> getMessage(String message) async {
    try {
      final response = await _dio.post(
        '/process-message/',
        data: {
          'message': message,
        },
      );
      return response.data['message'];
    } on DioException catch (e) {
      rethrow;
    }
  }

  /// Send message to the server
  Future<void> uploadImageWithFormData(
    String path,
    FormData formData,
  ) async {
    try {
      await _dio.post(
        path,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
    } on DioException catch (e) {
      rethrow;
    }
  }
}
