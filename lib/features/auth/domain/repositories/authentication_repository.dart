import 'package:test_project/core/exceptions/failures.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginResponseEntity>> login(LoginParams params);
}
