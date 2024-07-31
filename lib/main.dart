import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/control_state.dart';
import 'package:flutter_food_bite/screens/home.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControlState(),
      builder: (controlState) {
        return GetMaterialApp(
          theme: ThemeData(
            brightness:
                controlState.darkMode ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
