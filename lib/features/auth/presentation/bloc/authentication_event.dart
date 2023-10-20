part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class LoginEvent extends AuthenticationEvent {
  final String emailOrNickname;
  final String password;
  final Function(String errorMessage) onError;

  LoginEvent({
    required this.emailOrNickname,
    required this.password,
    required this.onError,
  });
  @override
  List<Object?> get props => [emailOrNickname, password, onError];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
