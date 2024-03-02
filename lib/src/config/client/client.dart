import 'package:apex_mobile/src/config/logging_interceptor.dart';
import 'package:dio/dio.dart';

final class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://da93-31-171-108-18.ngrok-free.app/api/v1',
    ),
  )..interceptors.add(LoggingInterceptor());

  Dio get instance => _dio;

  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

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
