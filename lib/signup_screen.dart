import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use ValueNotifier to handle passToggle states
    final ValueNotifier<bool> passToggle = ValueNotifier<bool>(true);
    final ValueNotifier<bool> confirmPassToggle = ValueNotifier<bool>(true);

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15),
              // Text widgets added before the image
              Text(
                "Selamat Datang",
                style: TextStyle(
                  color: Color.fromARGB(255, 68, 63, 144),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 5),
              // Text widgets added before the image
              Text(
                "Daftar",
                style: TextStyle(
                  color: Color.fromARGB(255, 68, 63, 144),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  "images/welcome.png",
                  width: 100, // Set desired width
                  height: 100, // Set desired height
                  fit: BoxFit.cover, // Adjust image fit as needed
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Email",
                      selectionColor: Color.fromARGB(43, 68, 63, 144),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: ValueListenableBuilder(
                  valueListenable: passToggle,
                  builder: (context, value, child) {
                    return TextField(
                      obscureText: value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Password",
                          selectionColor: Color.fromARGB(43, 68, 63, 144),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            passToggle.value = !passToggle.value;
                          },
                          child: Icon(
                            value
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                            color: Color.fromARGB(43, 68, 63, 144),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 1),
              Padding(
                padding: EdgeInsets.all(12),
                child: ValueListenableBuilder(
                  valueListenable: confirmPassToggle,
                  builder: (context, value, child) {
                    return TextField(
                      obscureText: value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Konfirmasi Password"),
                        suffixIcon: InkWell(
                          onTap: () {
                            confirmPassToggle.value = !confirmPassToggle.value;
                          },
                          child: Icon(
                            value
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Adding "Lupa Kata Sandi?" text to the right of the password field

              Padding(
                padding: const EdgeInsets.only(right: 4, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add your password recovery logic here
                      },
                      child: Text(
                        "Lupa Kata Sandi?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 63, 144),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
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
                                builder: (context) => HomeScreen()));
                        // Add your navigation logic here
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        child: Center(
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah mempunyai akun?",
                    style: TextStyle(
                      color: Color.fromARGB(79, 68, 63, 144),
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                      // Add your sign-up navigation logic here
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                        color: Color.fromARGB(255, 68, 63, 144),
                        fontSize: 18,
                      ),
                    ),
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
