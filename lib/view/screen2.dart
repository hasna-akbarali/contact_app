import 'package:contact_app/view/screen3.dart';
import 'package:contact_app/view/star_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/landing_controller.dart';
import '../models/restaurant_model.dart';

class Screen2 extends StatelessWidget {
  final Restaurant restaurant;
  final String phoneNumber;
  final LandingController landingController = Get.find();
  final int currentTabIndex;

  Screen2(
      {required this.restaurant,
      required this.currentTabIndex,
      required this.phoneNumber});

  void _goToScreen3(BuildContext context) {
    landingController.currentTabIndex();
    Get.offAll(() => Screen3(phoneNumber: restaurant.phoneNumber ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${restaurant.name}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${restaurant.cuisine} - ',
                    style: TextStyle(fontSize: 18),
                  ),
                  StarRating(rating: restaurant.rating ?? 0)
                ],
              ),
              SizedBox(height: 36),
              Text(
                restaurant.location?.address ?? "",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${restaurant.location?.city}, ${restaurant.location?.state}, ${restaurant.location?.zipCode}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 36),
              Row(
                children: [
                  Text(
                    'Website:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    restaurant.website ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  Text(
                    'Time: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${restaurant.hours?.open} - ${restaurant.hours?.close}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 26),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _goToScreen3(context),
                    child: Text('Contact Info'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
