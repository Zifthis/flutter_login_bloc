
part of 'authentication_bloc.dart';




///AuthenticationState instance will be the output of the
///AuthenticationBloc and will be consumed by the presentation layer.

@immutable
class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  ///AuthenticationState class has three named constructors:
  ///1. unknown(): the default state which indicates that
  ///the bloc does not yet know whether the current
  /// user is authenticated or not.
  /// 2. authenticated(): the state which
  /// indicates that the user is current authenticated.
  /// 3. unauthenticated(): the state which indicates
  /// that the user is current not authenticated.

  //1.
  const AuthenticationState.unknown() : this._();

  //2.
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  //3.
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];

}


