import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/control_state.dart';
import 'package:flutter_food_bite/screens/home_screen.dart';
import 'package:flutter_food_bite/screens/person.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List<Widget> page = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    const PersonScreen(),
  ];
  // late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlState>(
      init: ControlState(),
      builder: (controlState) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(5, (index) => page[controlState.index]),
            // controller: _pageController,
            onPageChanged: (value) {
              print(value);
            },
          ),
          // page[controlState.index]
          bottomNavigationBar: CircleNavBar(
            activeIndex: controlState.index,
            activeIcons: [
              Icon(Icons.home, color: Colors.blue[900]),
              Icon(Icons.label, color: Colors.blue[900]),
              Icon(Icons.add, color: Colors.blue[900]),
              Icon(Icons.notifications, color: Colors.blue[900]),
              Icon(Icons.person, color: Colors.blue[900]),
            ],
            inactiveIcons: const [
              Text('Home'),
              Text('Tag'),
              Text('Add'),
              Text('Nofi'),
              Text('Person'),
            ],
            height: 60,
            circleWidth: 60,
            color: controlState.darkMode ? Colors.black : Colors.white,
            onTap: (index) {
              controlState.changeIndex(index);
            },
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            shadowColor: Colors.deepPurple,
            circleShadowColor: Colors.deepPurple,
            elevation: 10,
            // gradient: const LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.black, Colors.grey],
            // ),
            // circleGradient: const LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.blue, Colors.red],
            // ),
          ),
        );
      },
    );
  }
}
