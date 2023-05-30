import 'package:contact_app/controllers/landing_controller.dart';
import 'package:contact_app/view/screen2.dart';
import 'package:contact_app/view/screen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/restaurant_model.dart';

class LandingPage extends StatelessWidget {
  final LandingController landingController = Get.put(LandingController());

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: landingController.restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = landingController.restaurants[index];
              return ListTile(
                title: Text(restaurant.name ?? ""),
                onTap: () {
                  landingController.selectRestaurant(restaurant);
                  _navigateToScreen2(context, restaurant);
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: landingController.currentTabIndex.value,
          onTap: (index) {
            if (index == 1) {
              _navigateToScreen3(context);
            } else {
              landingController.setCurrentTabIndex(index);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tab 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Tab 2',
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen2(BuildContext context, Restaurant restaurant) {
    final landingController = Get.find<LandingController>();
    landingController.selectRestaurant(restaurant);
    landingController.setCurrentTabIndex(0);
    Get.to(() => Screen2(
        restaurant: restaurant,
        currentTabIndex: landingController.currentTabIndex(),
        phoneNumber: restaurant.phoneNumber ?? ""));
  }

  void _navigateToScreen3(BuildContext context) {
    final landingController = Get.find<LandingController>();
    Get.to(() => Screen3(
          phoneNumber:
              landingController.selectedRestaurant.value?.phoneNumber ??
                  'No Contact Info Accessed by User',
        ));
  }
}
