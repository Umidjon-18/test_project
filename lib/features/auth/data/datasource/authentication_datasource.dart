import 'package:dio/dio.dart';
import 'package:test_project/core/exceptions/exceptions.dart';
import 'package:test_project/core/singletons/dio_settings.dart';
import 'package:test_project/core/singletons/service_locator.dart';
import 'package:test_project/features/auth/data/models/login_response_model.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_data_entity.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

abstract class AuthenticationDataSource {
  Future<LoginResponseModel> login(LoginParams params);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final Dio dio = serviceLocator<DioSettings>().dio();
  @override
  Future<LoginResponseModel> login(LoginParams params) async {
    try {
      final response = await dio.post(
        '/auth/login/',
        data: params.toJson(),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException(
          statusCode: response.statusCode ?? 400,
          errorMessage: "server exception",
        );
      }
    } on ServerException catch (e) {
      throw ServerException(statusCode: e.statusCode, errorMessage: e.errorMessage);
    } on DioException {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
