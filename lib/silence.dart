import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/meditasi.dart';
import 'package:myapp/setting.dart';
import 'package:myapp/waktu_silence10.dart';
import 'package:myapp/waktu_silence20.dart';
import 'package:myapp/waktu_silence30.dart';
import 'package:myapp/waktu_silence5.dart';

class SilenceScreen extends StatelessWidget {
  const SilenceScreen({super.key});

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeditasiScreen()));
          },
        ),
        title: Text(
          'Silence',
          style: TextStyle(color: Color.fromARGB(255, 68, 63, 144)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
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
                            builder: (context) => WaktuSilence5Screen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5 Menit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Icon(Icons.access_time, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                            builder: (context) => WaktuSilence10Screen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "10 Menit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Icon(Icons.access_time, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                            builder: (context) => WaktuSilence20Screen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "20 Menit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Icon(Icons.access_time, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                            builder: (context) => WaktuSilence30sScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "30 Menit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Icon(Icons.access_time, color: Colors.black),
                          ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );

                // Aksi ketika tombol "Home" ditekan
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(43, 68, 63, 144),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
