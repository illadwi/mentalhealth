import 'package:flutter/material.dart';
import 'package:myapp/setting.dart';
import 'package:myapp/silence.dart';
import 'package:myapp/home_screen.dart';

class WaktuSilence20Screen extends StatelessWidget {
  const WaktuSilence20Screen({super.key});

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
                              builder: (context) => SilenceScreen()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 68, 63, 144),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Silence',
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 63, 144), fontSize: 20),
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
                        '20:00',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Icon(
                        Icons.access_time,
                        size: 100,
                      ),
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
                          builder: (context) => HomeScreen(),
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
                          builder: (context) => SettingScreen(),
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
