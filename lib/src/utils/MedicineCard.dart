import 'package:flutter/material.dart';

import 'package:pills/src/utils/utilsColors.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final DateTime fechaDeCaducidad;
  final double disponible;

  const MedicineCard(
      {Key key,
      @required this.name,
      @required this.fechaDeCaducidad,
      @required this.disponible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: 100,
        color: bottonGray(),
        child: Row(
          children: [
            Container(
              color: Colors.green,
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: $name'),
                Text('$fechaDeCaducidad'),
                Text('Disponible: $disponible')
              ],
            )
          ],
        ),
      ),
    );
  }
}
