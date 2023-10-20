// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final FormzSubmissionStatus loginStatus;
  final UserDataEntity userData;
  final AuthenticationStatus authenticationStatus;

  const AuthenticationState({
    this.loginStatus = FormzSubmissionStatus.initial,
    this.userData = const UserDataEntity(),
    this.authenticationStatus = AuthenticationStatus.unauthenticated,
  });

  @override
  List<Object?> get props => [loginStatus, userData, authenticationStatus];

  AuthenticationState copyWith({
    FormzSubmissionStatus? loginStatus,
    UserDataEntity? userData,
    AuthenticationStatus? authenticationStatus,
  }) {
    return AuthenticationState(
      loginStatus: loginStatus ?? this.loginStatus,
      userData: userData ?? this.userData,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    );
  }
}
