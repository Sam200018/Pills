import 'package:flutter/material.dart';
import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/src/utils/UtilsWidgets.dart';
import 'package:pills/src/utils/utilsColors.dart';

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
            Text('House page en construccion'),
            _CreateHomeButton(
              houseFirebase: MedicineFirebase(),
            ),
            _InjoyToHouseButton()
          ],
        ),
      ),
    );
  }
}

class _CreateHomeButton extends StatelessWidget {
  final MedicineFirebase _houseFirebase;

  const _CreateHomeButton({Key key, MedicineFirebase houseFirebase})
      : assert(houseFirebase != null),
        _houseFirebase = houseFirebase,
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
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bottonBlue())),
        onPressed: () => print('Se unio a una casa'),
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
        ));
  }
}
