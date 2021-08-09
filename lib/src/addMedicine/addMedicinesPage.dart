import 'package:flutter/material.dart';

import 'package:pills/src/addMedicine/AddMedicineForm_Page.dart';

class AddMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nuevo Medicamento',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: MedicineForm(),
    );
  }
}
