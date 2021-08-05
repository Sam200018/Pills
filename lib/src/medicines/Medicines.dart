import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

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
          List<Medicine> medicines = state.medicines;
          return Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, int index) => Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.delete_forever,
                    size: 40.0,
                  ),
                ),
                onDismissed: (DismissDirection direction) {
                  BlocProvider.of<MedicineBloc>(context)
                      .add(DeleteMedicine(medicines[index]));
                },
                child: MedicineCard(
                  medicine: medicines[index],
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
