import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/repositories/repository.dart';
import '../../../domain/blocs/add_medicine/addmedicine_bloc.dart';

class MedicineDetailsPage extends StatefulWidget {
  final Medicine? receivedMedicine;

  const MedicineDetailsPage({Key? key, this.receivedMedicine})
      : super(key: key);

  @override
  _MedicineDetailsPageState createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
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
            ReasonInput(
              reasonMedicine: newMedicine,
              passedReason: newMedicine.reason,
            ),
            SizedBox(height: 16.0),
            ElementListInput(
              listMedicine: newMedicine,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: AlignmentDirectional.bottomCenter,
        child: TextButton(
          onPressed: () {
            print(newMedicine);
          },
          child: Text(
            (newMedicine.id != null) ? 'GUARDAR' : 'CREAR',
          ),
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
    return BlocBuilder<AddmedicineBloc, AddMedicineState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: passedName ?? " ",
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nombre del medicamento',
            hintText: 'Nombre del medicamento',
            errorText: (!state.isMedicineNameValid) ? 'Nombre invalido' : null,
          ),
          onChanged: (name) {
            nameMedicine.name = name;
            BlocProvider.of<AddmedicineBloc>(context)
                .add(MedicineNameChanged(name: name));
          },
        );
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
    return BlocBuilder<AddmedicineBloc, AddMedicineState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: '$passedAmout',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Dosis',
            errorText:
                (!state.isAmountValid) ? "Ingrese una cantidad valida" : null,
          ),
          onChanged: (amount) {
            amountMedicine.cantidad = double.parse(amount);
            BlocProvider.of<AddmedicineBloc>(context)
                .add(AmountChanged(amount: double.parse(amount)));
          },
        );
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
    return BlocBuilder<AddmedicineBloc, AddMedicineState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: '$passedAmountAble',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Cantidad disponible',
            errorText: (!state.isAmountAbleValid)
                ? 'Ingrese una cantidad valida'
                : null,
          ),
          onChanged: (amountAble) {
            amountAbleMedicine.disponible = double.parse(amountAble);
            BlocProvider.of<AddmedicineBloc>(context)
                .add(AmountAbleChanged(amountAble: double.parse(amountAble)));
          },
        );
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
      minLines: 3,
      maxLines: 5,
      initialValue: passedReason ?? " ",
      keyboardType: TextInputType.text,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Razon medica',
        hintText: 'Razon medica',
      ),
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
      decoration: InputDecoration(
        labelText: 'Fecha de caducidad',
      ),
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
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 3));

    if (picked != null) {
      setState(() {
        widget.dateTimeMedicine.fechaDeCaducidad = picked;
        _inputDate = TextEditingController(text: picked.toString());
      });
    }
  }
}

class ElementListInput extends StatelessWidget {
  final Medicine listMedicine;

  const ElementListInput({Key? key, required this.listMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: deviceSize.width * .85,
            child: BlocBuilder<AddmedicineBloc, AddMedicineState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Compuesto activo',
                    errorText: (!state.isActiveCompoundValid)
                        ? 'Ingrese un compuesto valido'
                        : null,
                  ),
                  onChanged: (activeCompound) {
                    BlocProvider.of<AddmedicineBloc>(context).add(
                        ActiveCompoundChanged(activeCompound: activeCompound));
                  },
                );
              },
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            child: IconButton(
              onPressed: () {
                print('se agrego un medicamento');
              },
              icon: Icon(
                Icons.add_circle_outline,
                size: 45.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
