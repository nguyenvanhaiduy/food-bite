import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/control_state.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControlState(),
      builder: (controlState) {
        return SafeArea(
          child: Center(
            child: Switch(
              onChanged: (value) {
                controlState.changeDarkMode(value);
              },
              value: controlState.darkMode,
            ),
          ),
        );
      },
    );
  }
}
