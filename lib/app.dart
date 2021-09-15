import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_login/splash/view/splash_page.dart';
import 'package:user_repository/user_repository.dart';

import 'home/view/home_page.dart';
import 'login/view/login_page.dart';



///app.dart is split into two parts App and AppView.
///App is responsible for creating/providing the AuthenticationBloc
///which will be consumed by the AppView.
///This decoupling will enable us to easily test
///both the App and AppView widgets later on.

class App extends StatelessWidget {

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  App({
    required this.authenticationRepository,
    required this.userRepository
  });


  ///RepositoryProvider is used to provide the single instance of
  ///AuthenticationRepository to the entire application
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: userRepository
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status){
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                      (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                      (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child:  child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

