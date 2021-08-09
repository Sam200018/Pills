import 'package:flutter/material.dart';
import 'package:pills/src/medicines/Medicines.dart';

import 'package:pills/src/utils/UtilsWidgets.dart';
import 'package:pills/src/utils/utilsColors.dart';

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListSide(),
      ),
      appBar: AppBar(
        //*Aca va el logo de la app
        leading: Icon(
          Icons.add_to_home_screen_sharp,
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: buttonText()),
              )),
              child: Text(
                'MEDICAMENTOS',
                style: TextStyle(color: buttonText(), fontSize: 25.0),
              ),
            ),
            Medicines()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addMedicine');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
