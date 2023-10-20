import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/domain/entities/user_data_entity.dart';

part 'user_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: false)
class UserDataModel extends UserDataEntity {
  UserDataModel({
    super.id,
    super.email,
    super.nickname,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
}
