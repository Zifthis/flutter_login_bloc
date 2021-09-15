import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';

///Upon a successful logIn request,
///the state of the AuthenticationBloc will change to authenticated
///and the user will be navigated to the HomePage where
///we display the user's id as well as a button to log out.

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ///The HomePage can access the current user id via
            ///context.select((AuthenticationBloc bloc) => bloc.state.user.id)
            ///and displays it via a Text widget.
            ///NOTE:
            ///context.select((AuthenticationBloc bloc) => bloc.state.user.id)
            ///-> will trigger updates if the user id changes.
            Builder(
              builder: (context) {
                final userId = context.select(
                      (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('UserID: $userId');
              },
            ),
            /// In addition, when the logout button is tapped,
            /// an AuthenticationLogoutRequested event is
            /// added to the AuthenticationBloc.
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
