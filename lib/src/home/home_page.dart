import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/house/house_page.dart';
import 'package:pills/src/medicine/MedicinePage.dart';

class HomePage extends StatefulWidget {
  final AuthenticationRepository _userRepository;

  const HomePage({Key key, AuthenticationRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: widget._userRepository.getIsInTheHouse(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data.get('isInTheHouse')) {
          return MedicinePage();
        } else {
          return HousePage();
        }
      },
    );
  }
}
