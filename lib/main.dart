import 'package:contact_app/view/landing_page.dart';
import 'package:contact_app/view/screen2.dart';
import 'package:contact_app/view/screen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/restaurant_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LandingPage()),
        GetPage(
          name: '/screen2',
          page: () => Screen2(
            restaurant: Restaurant(
              name: "Taj Coromandel",
              cuisine: "Indian",
              rating: 4.5,
              location: Location(
                address:
                    "100 Feet Road, HAL 2nd Stage, Indiranagar, Bengaluru, Karnataka 560008",
                city: "Bangalore",
                state: "Karnataka",
                zipCode: "560008",
              ),
              website: "www.tajcoromandel.com",
              phoneNumber: "(080) 3090 1234",
            ),
            currentTabIndex: 0,
            phoneNumber: "",
          ),
        ),
        GetPage(
          name: '/screen3',
          page: () => Screen3(
            phoneNumber: "(080) 3090 1234",
          ),
        ),
      ],
      onGenerateRoute: (settings) {
        if (settings.name == '/screen2') {
          final args = settings.arguments as Map<String, dynamic>? ?? {};
          return GetPageRoute(
            page: () => Screen2(
              restaurant: args['restaurant'],
              currentTabIndex: args['currentTabIndex'],
              phoneNumber: args['phoneNumber'],
            ),
          );
        } else if (settings.name == '/screen3') {
          final args = settings.arguments as Map<String, dynamic>? ?? {};
          return GetPageRoute(
            page: () => Screen3(
              phoneNumber: args['phoneNumber'],
            ),
          );
        }
        return null;
      },
    );
  }
}
