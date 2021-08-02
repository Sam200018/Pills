import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/src/medicine/Medicines.dart';
import 'package:pills/src/medicine/medicine_bloc/medicine_bloc.dart';

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineBloc>(
      create: (context) => MedicineBloc(),
      child: Medicines(),
    );
  }
}
