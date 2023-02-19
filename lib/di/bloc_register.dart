import 'package:get_it/get_it.dart';
import 'package:pills/repositories/authentication/authentication_repository.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';

final locator = GetIt.instance;

void setupBlocs() {
  var authenticationRepository = locator.get<AuthenticationRepository>();

  locator.registerFactory<AuthBloc>(() => AuthBloc(authenticationRepository));
  locator.registerFactory<LoginBloc>(() => LoginBloc(authenticationRepository));
}
