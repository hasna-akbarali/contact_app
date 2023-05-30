import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen3 extends StatelessWidget {
  final String phoneNumber;

  const Screen3({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen3'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              phoneNumber.isNotEmpty
                  ? phoneNumber
                  : 'No Contact Info Accessed by User',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(
                    '/landing?selectedTab=1&phoneNumber=$phoneNumber');
              },
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}
