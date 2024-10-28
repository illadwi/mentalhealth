import 'package:flutter/material.dart';
import 'package:myapp/kuisioner1.dart';
import 'package:myapp/meditasi.dart';
import 'package:myapp/setting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi Benaya!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 68, 63, 144),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),

              // Gray Card with progress indicators and descriptions
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(43, 68, 63, 144),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Progress indicators on the left
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProgressRow('Derajat'),
                          _buildProgressRow('Kecemasan'),
                          _buildProgressRow('Gangguan'),
                        ],
                      ),
                    ),
                    SizedBox(width: 10), // Space between columns

                    // Descriptions on the right
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ringan'),
                        Text('Sedang'),
                        SizedBox(height: 8),
                        Text(
                          'Terlihat hasil kuisioner\nlebih dari 3 hari terakhir',
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),

              // Grid buttons
              Row(
                children: [
                  Expanded(
                    child: _buildGridButton(
                      context,
                      Icons.list_alt,
                      'Kuesioner',
                      Kuisioner1Screen(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildGridButton(context, Icons.psychology,
                        'Meditasi', MeditasiScreen()),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Article & News Section
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(43, 68, 63, 144),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artikel & Berita',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildArticleCard('Apa Itu Kecemasan?',
                        'Perasaan cemas yang dialami dapat\ndicegah dan diatasi'),
                    _buildArticleCard('Cara Mengatasi Kecemasan',
                        'Pelajari beberapa cara untuk\nmengurangi kecemasan'),
                    _buildArticleCard('Apa itu meditasi?',
                        'Teknik menjernihkan pikiran untuk\nmempertajam fokus'),
                    _buildArticleCard('Pentingnya Meditasi',
                        'Meditasi sebagai metode untuk\nmengelola kecemasan'),
                    _buildArticleCard('Pentingnya Meditasi',
                        'Meditasi sebagai metode untuk\nmengelola kecemasan'),
                    _buildArticleCard('Pentingnya Meditasi',
                        'Meditasi sebagai metode untuk\nmengelola kecemasan'),
                    _buildArticleCard('Pentingnya Meditasi',
                        'Meditasi sebagai metode untuk\nmengelola kecemasan'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 68, 63, 144),
              ),
              onPressed: () {
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

  // Progress row widget
  Widget _buildProgressRow(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Container(
            height: 15,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 68, 63, 144),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  // Grid button widget
  Widget _buildGridButton(
      BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(43, 68, 63, 144),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 30),
            SizedBox(height: 5),
            Text(label),
          ],
        ),
      ),
    );
  }

  // Article card widget
  Widget _buildArticleCard(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(Icons.article, size: 40),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                overflow: TextOverflow.fade,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
