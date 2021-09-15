import 'package:equatable/equatable.dart';

/// WE NEED TO CREATE THIS FILE WHICH WILL CONTAIN THE
/// PUBLIC EXPORT.

///NOTE!
///package: Equatable is used to enable value comparisons of the
///User object.
class User extends Equatable {

  ///for simplicity, a user just has an ID property but in practice
  ///we might have additional props like firstName, lastName, avatarUrl...
  const User(this.id);
  final String id;


  @override
  List<Object> get props => [id];

  static const empty = User('-');

}