import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/data/model/medicine.dart';
import 'package:pills/ui/core/ui/MedicineCard.dart';
import '../../../domain/blocs/medicines/medicine_bloc.dart';

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
        } else if (state is MedicinesNotLoaded) {
          return Center(
            child: Column(
              children: [Icon(Icons.error), Text('Cannot load medicines')],
            ),
          );
        } else if (state is MedicinesLoaded) {
          List<Medicine> medicines = state.medicines;
          return (medicines.length == 0)
              ? _NotMedicines()
              : Expanded(
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
                        medicines[index],
                      ),
                    ),
                  ),
                );
        } else {
          return _NotMedicines();
        }
      },
    );
  }
}

class _NotMedicines extends StatelessWidget {
  const _NotMedicines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Parece que no tienes medicinas agregadas :('),
          Text('Polsa el boton de + para agregar una  ')
        ],
      ),
    );
  }
}
