import 'package:test_project/core/exceptions/exceptions.dart';
import 'package:test_project/core/exceptions/failures.dart';
import 'package:test_project/core/singletons/service_locator.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/features/auth/data/datasource/authentication_datasource.dart';
import 'package:test_project/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_project/features/auth/domain/repositories/authentication_repository.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource = serviceLocator<AuthenticationDataSource>();
  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginParams params) async{
    try {
      var result = await authenticationDataSource.login(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, errorMessage: e.errorMessage));
    } on DioExceptions catch (_) {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }
}
