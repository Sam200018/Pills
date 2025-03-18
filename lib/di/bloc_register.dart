import 'package:get_it/get_it.dart';
import 'package:pills/data/repository/authentication_repository.dart';
import 'package:pills/ui/Authentication/bloc/auth_bloc.dart';
import 'package:pills/ui/Login/bloc/login_bloc.dart';
import 'package:pills/ui/Signup/bloc/signup_bloc.dart';



final locator = GetIt.instance;

void setupBlocs() {
  var authenticationRepository = locator.get<AuthenticationRepository>();

  locator.registerFactory<AuthBloc>(() => AuthBloc(authenticationRepository));
  locator.registerFactory<LoginBloc>(() => LoginBloc(authenticationRepository));
  locator
      .registerFactory<SignupBloc>(() => SignupBloc(authenticationRepository));
}
