import 'package:flutter/material.dart';
import 'package:myapp/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini waktunya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 63, 144),
              ),
            ),
            Text(
              'Menjadi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 63, 144),
              ),
            ),
            Text(
              'lebih baik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 63, 144),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                "images/welcome.png",
                width: 100, // Set desired width
                height: 100, // Set desired height
                fit: BoxFit.cover, // Adjust image fit as needed
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: Color.fromARGB(255, 68, 63, 144),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child: Center(
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
