import 'package:flutter/material.dart';
import 'package:pills/src/utils/UtilsWidgets.dart';
import 'package:pills/src/utils/utilsColors.dart';

class Medicines extends StatefulWidget {
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListSide(),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: buttonDeepGray()),
        //*Aca va el logo de la app
        leading: Icon(
          Icons.add_to_home_screen_sharp,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
        ],
      ),
    );
  }
}
