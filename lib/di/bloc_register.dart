import 'package:get_it/get_it.dart';
import 'package:pills/data/authentication/authentication_repository.dart';
import 'package:pills/domain/blocs/auth/auth_bloc.dart';
import 'package:pills/domain/blocs/login/login_bloc.dart';
import 'package:pills/domain/blocs/signup/signup_bloc.dart';



final locator = GetIt.instance;

void setupBlocs() {
  var authenticationRepository = locator.get<AuthenticationRepository>();

  locator.registerFactory<AuthBloc>(() => AuthBloc(authenticationRepository));
  locator.registerFactory<LoginBloc>(() => LoginBloc(authenticationRepository));
  locator
      .registerFactory<SignupBloc>(() => SignupBloc(authenticationRepository));
}
