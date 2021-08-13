import 'package:flutter/material.dart';

class MedicineForm extends StatefulWidget {
  const MedicineForm({Key? key}) : super(key: key);

  @override
  _MedicineFormState createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _MedicineNameInput(name: 'okay'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class _MedicineNameInput extends StatelessWidget {
  final String? name;

  const _MedicineNameInput({Key? key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: name,
      autocorrect: false,
      decoration: InputDecoration(labelText: 'Nombre del medicamento'),
      keyboardType: TextInputType.name,
    );
  }
}
