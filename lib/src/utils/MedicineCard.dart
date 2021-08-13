import 'package:flutter/material.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

import 'package:pills/src/utils/utilsColors.dart';

class MedicineCard extends StatelessWidget {
  final Medicine _medicine;

  const MedicineCard(Medicine medicine, {Key? key})
      : _medicine = medicine,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 100,
      color: bottonGray(),
      child: ListTile(
        title: Text(_medicine.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha de caducidad: ${_medicine.fechaDeCaducidad}'),
            Text('Cantidad disponible: ${_medicine.cantidad}'),
          ],
        ),
        onTap: () => print('${_medicine.name}'),
      ),
    );
  }
}
