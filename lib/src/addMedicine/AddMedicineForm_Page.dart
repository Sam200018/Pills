import 'package:flutter/material.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

class MedicineForm extends StatefulWidget {
  const MedicineForm({Key key}) : super(key: key);

  @override
  _MedicineFormState createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final TextEditingController _medicineName = TextEditingController(),
      activeCompound = TextEditingController();
  double amount = 0, amountAble = 0;

  @override
  Widget build(BuildContext context) {
    final Medicine medicine =
        ModalRoute.of(context).settings.arguments as Medicine;

    return Align(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _MedicineNameInput(name: medicine.name),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class _MedicineNameInput extends StatelessWidget {
  final String name;

  const _MedicineNameInput({Key key, this.name}) : super(key: key);
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

class _FechaInput extends StatelessWidget {
  _FechaInput({Key key, DateTime date})
      : assert(date != null),
        _fecha = date,
        super(key: key);

  final DateTime _fecha;
  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _fecha,
      onDateSubmitted: (value) {},
    );
  }
}
