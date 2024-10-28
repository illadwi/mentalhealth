import 'package:flutter/material.dart';
import 'package:myapp/atur_nafas.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/setting.dart';
import 'package:myapp/silence.dart';
import 'package:myapp/yoga.dart'; // Pastikan ini file untuk tambah meditasi

class MeditasiScreen extends StatelessWidget {
  const MeditasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 68, 63, 144),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text(
          'Meditasi',
          style: TextStyle(color: Color.fromARGB(255, 68, 63, 144)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Tombol "Silence"
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Color.fromARGB(43, 68, 63, 144),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SilenceScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Silence",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Tombol "Atur Nafas"
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Color.fromARGB(43, 68, 63, 144),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AturNafasScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Atur Nafas",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Tombol "Yoga"
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Color.fromARGB(43, 68, 63, 144),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YogaScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Yoga",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(43, 68, 63, 144),
              ),
              onPressed: () {
                // Navigasi ke halaman utama
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(43, 68, 63, 144),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
