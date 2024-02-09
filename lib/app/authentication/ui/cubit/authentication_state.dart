part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationFailure extends AuthenticationState {}
