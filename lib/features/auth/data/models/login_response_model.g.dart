// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      tokens: const TokenConverter()
          .fromJson(json['tokens'] as Map<String, dynamic>?),
      user: const UserDataConverter()
          .fromJson(json['user'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'tokens': const TokenConverter().toJson(instance.tokens),
      'user': const UserDataConverter().toJson(instance.user),
    };
