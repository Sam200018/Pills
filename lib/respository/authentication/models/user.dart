import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String id;
  final String name;
  final String lastName;

  const User({
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.lastName,
  })  : assert(email != null),
        assert(id != null);

  static const empty = User(email: '', id: '', name: null, lastName: null);

  @override
  List<Object> get props => [email, id, name, lastName];
}
