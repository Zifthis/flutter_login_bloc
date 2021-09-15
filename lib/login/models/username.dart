import 'package:formz/formz.dart';

/// We're using package:formz to create reusable and standard models
/// for the username and password.

enum UsernameValidationError { empty }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty(String value) : super.dirty(value);

  ///For simplicity, we are just validating
  ///the username to ensure that it is not empty
  ///but in practice you can enforce special character usage, length, etc...

  @override
  UsernameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}
