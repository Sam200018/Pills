import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/src/medicines/medicine_bloc/medicine_bloc.dart';
import 'package:pills/src/utils/MedicineCard.dart';

class Medicines extends StatefulWidget {
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MedicinesNotLoaded) {
          return Center(
            child: Column(
              children: [Icon(Icons.error), Text('Cannot load medicines')],
            ),
          );
        }
        if (state is MedicinesLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.medicines.length,
              itemBuilder: (context, int index) => Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                secondaryBackground: Container(color: Colors.blue),
                child: MedicineCard(
                  name: state.medicines.elementAt(index).name,
                  fechaDeCaducidad:
                      state.medicines.elementAt(index).fechaDeCaducidad,
                  disponible: state.medicines.elementAt(index).disponible,
                ),
              ),
            ),
          );
        }
        return Container(
          child: Center(
            child: Text('Holi'),
          ),
        );
      },
    );
  }
}
