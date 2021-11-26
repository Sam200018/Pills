import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/src/home/home_bloc/home_bloc.dart';
import 'package:pills/src/utils/utilsColors.dart';

class HousePage extends StatefulWidget {
  @override
  _HousePageState createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return Scaffold(
            body: Center(
              child: Text("Cargando"),
            ),
          );
        }
        if (state is InHouseState) {
          return Scaffold(
            body: Center(
              child: Text("En casa"),
            ),
          );
        }
        if (state is NotHouseState) {
          return Scaffold(
            body: Center(
              child: Text("No casa"),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text("No se que pedo"),
            ),
          );
        }
        // return Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       'Pills',
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        //   endDrawer: Drawer(
        //     child: ListSide(),
        //   ),
        //   body: Center(
        //     child: Column(
        //       children: [
        //         _CreateHomeButton(
        //           houseFirebase: MedicineFirebase(),
        //         ),
        //         _InjoyToHouseButton(
        //           houseFirebase: MedicineFirebase(),
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}

class _CreateHomeButton extends StatelessWidget {
  final MedicineFirebase _houseFirebase;

  const _CreateHomeButton({Key? key, required MedicineFirebase houseFirebase})
      : _houseFirebase = houseFirebase,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bottonGreen())),
      onPressed: () => _houseFirebase.createHouse(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Crear una casa',
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _InjoyToHouseButton extends StatelessWidget {
  final MedicineFirebase _houseFirebase;

  const _InjoyToHouseButton({Key? key, required MedicineFirebase houseFirebase})
      : _houseFirebase = houseFirebase,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bottonBlue())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'unirse a una casa',
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.group_add,
            color: Colors.white,
          ),
        ],
      ),
      onPressed: () async {
        // TODO: Probar este codigo con la implementacion del generador de QR code
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#526AFA', 'Cancelar scanner', false, ScanMode.QR);
        print(barcodeScanRes);
        // _houseFirebase.joinHouse(barcodeScanRes);
      },
    );
  }
}
