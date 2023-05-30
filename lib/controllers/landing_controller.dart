import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../models/restaurant_model.dart';

class LandingController extends GetxController {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  final selectedRestaurant = Rxn<Restaurant>();
  final currentTabIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final String data = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(data);

    if (jsonData.containsKey('restaurants')) {
      final List<dynamic> restaurantData = jsonData['restaurants'];
      restaurants.value =
          restaurantData.map((item) => Restaurant.fromJson(item)).toList();
    }
  }

  void selectRestaurant(Restaurant restaurant) {
    selectedRestaurant.value = restaurant;
  }

  void setCurrentTabIndex(int index) {
    currentTabIndex.value = index;
  }
}
