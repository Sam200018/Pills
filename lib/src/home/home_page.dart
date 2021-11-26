import 'package:flutter/material.dart';

import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/house/house_page.dart';

class HomePage extends StatelessWidget {
  final AuthenticationRepository _userRepository;

  const HomePage({Key? key, required AuthenticationRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return HousePage();
  }
}
