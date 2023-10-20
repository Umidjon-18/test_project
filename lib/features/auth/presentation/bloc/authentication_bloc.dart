import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/singletons/storage/storage.dart';
import 'package:test_project/core/singletons/storage/store_keys.dart';
import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/core/utils/formz_submission_status.dart';
import 'package:test_project/features/auth/domain/entities/token_entity.dart';
import 'package:test_project/features/auth/domain/entities/user_data_entity.dart';
import 'package:test_project/features/auth/domain/usecases/login_usecase.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase loginUseCase = LoginUseCase();
  AuthenticationBloc() : super(const AuthenticationState()) {
    //Events
    on<LoginEvent>(_login);
    on<LogoutEvent>(_logout);
  }

  //Handlers
  _login(LoginEvent event, emit) async {
    if (event.emailOrNickname.trim().isEmpty || event.password.trim().isEmpty) {
      event.onError('Поля не должны быть пустыми');
    } else {
      emit(state.copyWith(loginStatus: FormzSubmissionStatus.inProgress));
      final result = await loginUseCase(LoginParams(
        email: isEmail(event.emailOrNickname) ? event.emailOrNickname : null,
        nickname: isEmail(event.emailOrNickname) ? null : event.emailOrNickname,
        password: event.password,
      ));
      if (result.isRight) {
        saveToken(result.right.tokens);
        emit(
          state.copyWith(
            loginStatus: FormzSubmissionStatus.success,
            userData: result.right.user,
            authenticationStatus: AuthenticationStatus.authenticated,
          ),
        );
      } else {
        emit(state.copyWith(loginStatus: FormzSubmissionStatus.failure));
      }
    }
  }

  _logout(event, emit) {
    deleteToken();
    emit(state.copyWith(
      authenticationStatus: AuthenticationStatus.unauthenticated,
      userData: const UserDataEntity(),
    ));
  }

  bool isEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );

    return emailRegex.hasMatch(email);
  }

  saveToken(TokenEntity token) {
    StorageRepository.putString(StoreKeys.token, token.accesToken);
    StorageRepository.putString(StoreKeys.refresh, token.refreshToken);
  }

  deleteToken() {
    StorageRepository.deleteString(StoreKeys.token);
    StorageRepository.deleteString(StoreKeys.refresh);
  }
}
