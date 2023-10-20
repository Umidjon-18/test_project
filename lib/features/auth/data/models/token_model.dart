import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';

part 'token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: false)
class TokenModel extends TokenEntity {
  TokenModel({
    required super.accesToken,
    required super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
