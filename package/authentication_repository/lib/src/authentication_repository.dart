import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

  ///AuthenticationRepository expose a stream of AuthenticationStatus
  ///updates which will be used to notify the app when a user signs in-out

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// There are 2 methods: logIn & logOut
  /// Those two methods are for simplicity but can easily
  /// be extended to authenticate with firebaseAuth or else.


  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  ///Since we're maintaining a StreamController internally,
  ///a dispose method is exposed so that the controller can
  ///be closed when is no longer needed.

  void dispose() => _controller.close();
}
