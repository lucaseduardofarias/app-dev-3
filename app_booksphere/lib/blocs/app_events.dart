import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoginFetchEvent extends UserEvent {
  final String usuario;
  final String senha;

  const LoginFetchEvent({required this.usuario, required this.senha});

  @override
  List<Object> get props => [usuario, senha];
}
