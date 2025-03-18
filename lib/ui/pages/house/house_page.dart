import 'package:flutter/material.dart';
import 'package:pills/ui/core/utils/UtilsWidgets.dart';
import 'package:pills/ui/core/utils/utilsColors.dart';


class HousePage extends StatelessWidget {
  const HousePage({Key? key}) : super(key: key);

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
          children: [_CreateHomeButton(), _InjoyToHouseButton()],
        ),
      ),
    );
  }
}

class _CreateHomeButton extends StatelessWidget {
  const _CreateHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bottonGreen())),
      onPressed: () => null,
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
  const _InjoyToHouseButton({
    Key? key,
  }) : super(key: key);

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

        // _houseFirebase.joinHouse(barcodeScanRes);
      },
    );
  }
}
