import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/control_state.dart';

class Search extends StatelessWidget {
  final ControlState controlState;
  const Search({super.key, required this.controlState});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: controlState.darkMode
                  ? Colors.white.withOpacity(0.4)
                  : Colors.black.withOpacity(0.4),
              blurRadius: 5,
              offset: const Offset(0, 3),
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: Colors.red),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
            ),
          ),
          // contentPadding: EdgeInsets.all(2),
        ),
      ),
    );
  }
}
