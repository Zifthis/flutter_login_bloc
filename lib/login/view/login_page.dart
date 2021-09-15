import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/login.dart';
import 'login_form.dart';

///the LoginPage is responsible for exposing the Route
///as well as creating and providing the LoginBloc to the LoginForm.
class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
              ///RepositoryProvider.of<AuthenticationRepository>(context)
              ///is used to lookup the instance of AuthenticationRepository
              ///via the BuildContext.
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}