part of 'authentication_bloc.dart';


///AuthenticationEvent instance will be the input to the
///AuthenticationBloc and will be processed and used to emit the
///new AuthenticationState instance.

@immutable
abstract class AuthenticationEvent extends Equatable {
  ///in this app, the AuthenticationBloc will be reacting to
  ///two different events:
  ///1. AuthenticationStatusChanged: notifies the bloc of a
  ///change to the user's AuthenticationStatus
  ///2. AuthenticationLogoutRequested: notifies the bloc of a logout request

  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;

  AuthenticationStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
