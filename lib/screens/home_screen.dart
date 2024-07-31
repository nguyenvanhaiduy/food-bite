import 'package:flutter/material.dart';
import 'package:flutter_food_bite/models/categories.dart';
import 'package:flutter_food_bite/models/control_state.dart';
import 'package:flutter_food_bite/models/restaurants.dart';
import 'package:flutter_food_bite/screens/trending_resturant.dart';
import 'package:flutter_food_bite/widgets/card_categories.dart';
import 'package:flutter_food_bite/widgets/card_trending.dart';
import 'package:flutter_food_bite/widgets/search.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControlState(),
      builder: (controlState) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Search(controlState: controlState),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending Restaurants',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () =>
                                TrendingRestaurent(controlState: controlState),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromARGB(255, 74, 83, 203),
                          ),
                        ),
                        child: const Text('Sea all (43)'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  // color: Colors.white,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Map restaurant = restaurants[index];
                      return CardTrending(
                        url: restaurant["img"],
                        title: restaurant["title"],
                        address: restaurant["address"],
                        rating: restaurant["rating"],
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 20),
                    itemCount: restaurants.length,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromARGB(255, 74, 83, 203),
                          ),
                        ),
                        child: const Text('Sea all (9)'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: ((context, index) {
                      Map category = categories[index];
                      return CardCategories(
                        url: category["img"],
                        name: category["name"],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
