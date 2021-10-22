import 'package:flutter/material.dart';
import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/src/utils/UtilsWidgets.dart';
import 'package:pills/src/utils/utilsColors.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HousePage extends StatefulWidget {
  @override
  _HousePageState createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pills',
          style: TextStyle(color: Colors.black),
        ),
      ),
      endDrawer: Drawer(
        child: ListSide(),
      ),
      body: Center(
        child: Column(
          children: [
            _CreateHomeButton(
              houseFirebase: MedicineFirebase(),
            ),
            _InjoyToHouseButton(
              houseFirebase: MedicineFirebase(),
            )
          ],
        ),
      ),
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
