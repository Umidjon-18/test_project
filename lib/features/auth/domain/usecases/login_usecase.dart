import 'package:test_project/core/exceptions/failures.dart';
import 'package:test_project/core/singletons/service_locator.dart';
import 'package:test_project/core/usecases/usecase.dart';
import 'package:test_project/core/utils/either.dart';
import 'package:test_project/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_project/features/auth/domain/repositories/authentication_repository.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, LoginParams> {
  final AuthenticationRepository authenticationRepository = serviceLocator<AuthenticationRepository>();
  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginParams params) async {
    return await authenticationRepository.login(params);
  }
}

class LoginParams {
  final String? email;
  final String? nickname;
  final String password;

  LoginParams({
    required this.email,
    required this.nickname,
    required this.password,
  }) : assert(email != null || nickname != null, 'Email or nickname must not be null!!!');
  Map<String, dynamic> toJson() {
    if (email != null) {
      return {
        'email': email,
        'password': password,
      };
    } else {
      return {
        'nickname': nickname,
        'password': password,
      };
    }
  }
}
