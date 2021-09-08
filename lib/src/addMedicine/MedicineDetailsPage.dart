import 'package:flutter/material.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

class MedicineDetailsPage extends StatefulWidget {
  final Medicine? receivedMedicine;

  const MedicineDetailsPage({Key? key, this.receivedMedicine})
      : super(key: key);

  @override
  _MedicineDetailsPageState createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  //TODO:aca tenemos que revisar si funciona
  // creando un medicamento en Firebase en
  // la cuenta: sastreriabb@hotmail.com
  Medicine newMedicine = Medicine.empty();

  @override
  void initState() {
    newMedicine = widget.receivedMedicine ?? Medicine.empty();
    print(newMedicine);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Medicamento"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NameInput(
              nameMedicine: newMedicine,
              passedName: newMedicine.name,
            ),
            SizedBox(height: 16.0),
            AmountInput(
              amountMedicine: newMedicine,
              passedAmout: newMedicine.cantidad,
            ),
            SizedBox(height: 16.0),
            AmountAbleInput(
              amountAbleMedicine: newMedicine,
              passedAmountAble: newMedicine.disponible,
            ),
            SizedBox(height: 16.0),
            DateInput(
                passedDateTime: newMedicine.fechaDeCaducidad,
                dateTimeMedicine: newMedicine),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                print(newMedicine);
              },
              child: Text(
                (newMedicine.id != null) ? 'Guardar' : 'Crear',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  final String? passedName;
  final Medicine nameMedicine;

  const NameInput({Key? key, this.passedName, required this.nameMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: passedName ?? " ",
      keyboardType: TextInputType.name,
      onChanged: (name) {
        nameMedicine.name = name;
      },
    );
  }
}

class AmountInput extends StatelessWidget {
  final double? passedAmout;
  final Medicine amountMedicine;

  const AmountInput(
      {Key? key, this.passedAmout = 0.0, required this.amountMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '$passedAmout',
      keyboardType: TextInputType.number,
      onChanged: (amount) {
        amountMedicine.cantidad = double.parse(amount);
      },
    );
  }
}

class AmountAbleInput extends StatelessWidget {
  final double? passedAmountAble;
  final Medicine amountAbleMedicine;

  const AmountAbleInput(
      {Key? key, this.passedAmountAble = 0.0, required this.amountAbleMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '$passedAmountAble',
      keyboardType: TextInputType.number,
      onChanged: (amountAble) {
        amountAbleMedicine.disponible = double.parse(amountAble);
      },
    );
  }
}

class ReasonInput extends StatelessWidget {
  final String? passedReason;
  final Medicine reasonMedicine;

  const ReasonInput({Key? key, this.passedReason, required this.reasonMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: passedReason ?? " ",
      keyboardType: TextInputType.text,
      onChanged: (reason) {
        reasonMedicine.reason = reason;
      },
    );
  }
}

class DateInput extends StatefulWidget {
  final DateTime passedDateTime;
  final Medicine dateTimeMedicine;

  const DateInput(
      {Key? key, required this.passedDateTime, required this.dateTimeMedicine})
      : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  TextEditingController? _inputDate;
  @override
  void initState() {
    _inputDate = new TextEditingController(
        text: '${widget.dateTimeMedicine.fechaDeCaducidad}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputDate,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.passedDateTime,
        firstDate: widget.passedDateTime,
        lastDate: DateTime(DateTime.now().year + 3));

    if (picked != null) {
      setState(() {
        widget.dateTimeMedicine.fechaDeCaducidad = picked;
        _inputDate = TextEditingController(text: picked.toString());
      });
    }
  }
}
