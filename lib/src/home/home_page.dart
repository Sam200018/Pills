import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/src/house/house_page.dart';
import 'package:pills/src/medicines/MedicinePage.dart';
import 'package:pills/src/medicines/medicine_bloc/medicine_bloc.dart';

class HomePage extends StatefulWidget {
  final AuthenticationRepository _userRepository;

  const HomePage({Key? key, required AuthenticationRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

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
        if (snapshot.data?.get('isInTheHouse')) {
          return BlocProvider<MedicineBloc>(
            create: (context) =>
                MedicineBloc(MedicineFirebase())..add(LoadMedicines()),
            child: MedicinePage(),
          );
        } else {
          return HousePage();
        }
      },
    );
  }
}
