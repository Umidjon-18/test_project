import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_data_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: false)
class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    required super.tokens,
    required super.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}
