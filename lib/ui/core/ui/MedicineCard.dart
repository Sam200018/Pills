import 'package:flutter/material.dart';
import 'package:pills/ui//utils/utils.dart';
import '../../../data/model/medicine.dart';
import '../../pages/addMedicine/MedicineDetailsPage.dart';

class MedicineCard extends StatelessWidget {
  final Medicine _medicine;

  const MedicineCard(Medicine medicine, {Key? key})
      : _medicine = medicine,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return MedicineDetailsPage(
              receivedMedicine: _medicine,
            );
          },
        ));
      },
    );
  }
}
