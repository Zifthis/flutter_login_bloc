part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


///in this app there are 3 different loginEvent types:
///1. LoginUsernameChanged: notifies the bloc that the username has been modified.
///2. LoginPasswordChanged: notifies the bloc that the password has been modified.
///3. LoginSubmitted: notifies the bloc that the form has been submitted.

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}