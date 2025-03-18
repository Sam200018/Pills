import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/ui/Home/bloc/home_bloc.dart';
import 'package:pills/domain/blocs/medicines/medicine_bloc.dart';
import 'package:pills/ui/pages/house/house_page.dart';
import 'package:pills/ui/pages/medicines/MedicinePage.dart';


class HomePageSelection extends StatefulWidget {
  @override
  _HomePageSelectionState createState() => _HomePageSelectionState();
}

class _HomePageSelectionState extends State<HomePageSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ErrorHouseState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Error al cargar tu solicitud',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is InHouseState) {
            return BlocProvider<MedicineBloc>(
              create: (_) => MedicineBloc()..add(LoadMedicines()),
              child: MedicinePage(),
            );
          }
          if (state is NotHouseState) {
            return HousePage();
          } else {
            return Scaffold(
              body: Center(
                child: Text("Cargando"),
              ),
            );
          }
        },
      ),
    );
  }
}
