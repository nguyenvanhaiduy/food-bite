import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/control_state.dart';
import 'package:flutter_food_bite/models/restaurants.dart';
import 'package:flutter_food_bite/widgets/card_trending.dart';
import 'package:flutter_food_bite/widgets/search.dart';

class TrendingRestaurent extends StatelessWidget {
  final ControlState controlState;
  const TrendingRestaurent({super.key, required this.controlState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending Restaurants',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Search(
            controlState: controlState,
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Map restaurant = restaurants[index];
                return CardTrending(
                  url: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
              separatorBuilder: (_, index) => const SizedBox(height: 20),
              itemCount: restaurants.length,
            ),
          )
        ],
      ),
    );
  }
}
