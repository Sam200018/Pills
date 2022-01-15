import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/routes.dart';
import 'package:pills/src/Auth/AuthController.dart';

import 'package:pills/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pills',
      theme: theme,
      home: const Center(
        child: CircularProgressIndicator(),
      ),
      getPages: AppPages.routes,
    );
  }
}
