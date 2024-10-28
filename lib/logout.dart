import 'package:flutter/material.dart';
import 'package:myapp/setting.dart';
import 'package:myapp/welcome_screen.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(43, 68, 63, 144),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(32.0),
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'LOG OUT',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 16),
              Text(
                'Hi Benaya,\nApakah Anda yakin ingin keluar dari aplikasi saya?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(126, 68, 63, 144),
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Ya',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 16),
                  // Updated TextButton to have white background and black text
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(43, 68, 63, 144),
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Tidak',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
