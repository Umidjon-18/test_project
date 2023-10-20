import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_data_entity.dart';

class LoginResponseEntity {
  @TokenConverter()
  final TokenEntity tokens;
  @UserDataConverter()
  final UserDataEntity user;

  const LoginResponseEntity({
    required this.tokens,
    required this.user,
  });
}
