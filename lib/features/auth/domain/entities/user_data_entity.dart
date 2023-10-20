import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/features/auth/data/models/user_data_model.dart';

class UserDataEntity {
  final int id;
  final String email;
  final String nickname;

  const UserDataEntity({
     this.id = -1,
     this.email = '',
     this.nickname = '',
  });
}



class UserDataConverter implements JsonConverter<UserDataEntity, Map<String, dynamic>?> {
  const UserDataConverter();

  @override
  UserDataEntity fromJson(Map<String, dynamic>? json) {
    return UserDataModel.fromJson(json ?? {});
  }

  @override
  Map<String, dynamic>? toJson(UserDataEntity object) => {
    "id": object.id,
    "email": object.email,
    "nickname": object.nickname,
  };
}