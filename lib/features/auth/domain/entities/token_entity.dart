import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/features/auth/data/models/token_model.dart';

class TokenEntity {
  final String accesToken;
  final String refreshToken;

  const TokenEntity({
    required this.accesToken,
    required this.refreshToken,
  });
}


class TokenConverter implements JsonConverter<TokenEntity, Map<String, dynamic>?> {
  const TokenConverter();

  @override
  TokenEntity fromJson(Map<String, dynamic>? json) {
    return TokenModel.fromJson(json ?? {});
  }

  @override
  Map<String, dynamic>? toJson(TokenEntity object) => {
    "accessToken": object.accesToken,
    "refreshToken": object.refreshToken,
  };
}

