import 'package:bloc_demo/model/token.dart';
import 'package:bloc_demo/model/user_model.dart';
import 'package:equatable/equatable.dart';

import 'app_events.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  const UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String error;
  const UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}

/* abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
} */

class LoginEmptyState extends UserState {
  const LoginEmptyState();
}

class LoginFetchingState extends UserState {}

class LoginFetchedState extends UserState {
  final Token token;

  const LoginFetchedState({required this.token});

  @override
  List<Object> get props => [token];
}

class LoginErrorState extends UserState {
  final Exception exception;
  final UserEvent event;

  const LoginErrorState({required this.exception, required this.event});

  @override
  List<Object> get props => [exception];
}
