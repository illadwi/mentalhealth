import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/setting.dart';
import 'package:myapp/yoga.dart';

class WaktuYoga30Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YogaScreen()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromARGB(255, 68, 63, 144),
                    ),
                  ),
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    'Yoga',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 68, 63, 144)),
                  ),
                ],
              ),
            ),
            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Duduk tenang, pejamkan mata, tarik napas dalam, dan fokus pada keheningan tanpa merespon pikiran yang muncul.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      Text(
                        '30:00',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30), // Add space between text and icon
                      Icon(Icons.access_time,
                          size: 100), // Move icon down with spacing
                    ],
                  ),
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, size: 40),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add your pause functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 68, 63, 144),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text('Pause'),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.volume_up, size: 40),
                    ],
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(), // Navigate to Home screen
                        ),
                      );
                    },
                    child: Icon(Icons.home,
                        size: 30, color: Color.fromARGB(43, 68, 63, 144)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SettingScreen(), // Navigate to Settings screen
                        ),
                      );
                    },
                    child: Icon(Icons.settings,
                        size: 30, color: Color.fromARGB(43, 68, 63, 144)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
