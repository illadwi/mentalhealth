import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/kuisioner1.dart';
import 'package:myapp/meditasi.dart';
import 'package:myapp/setting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  String? username;
  String? selectedEmotion; // Variable to track the selected emotion

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    if (userId.isNotEmpty) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users') // Sesuaikan dengan nama koleksi di Firestore
            .doc(userId)
            .get();

        setState(() {
          username = userDoc['username']; // Sesuaikan dengan field di Firestore
        });
      } catch (e) {
        print("Error fetching username: $e");
      }
    }
  }

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
                    'Hi ${username ?? "User"}!', // Display username or default text
                    style: TextStyle(
                      color: Color.fromARGB(255, 68, 63, 144),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),

              // Greeting and Emotion Section
              _buildGreetingSection(),

              SizedBox(height: 5),

              // Grid buttons
              Row(
                children: [
                  Expanded(
                    child: _buildGridButton(
                      context,
                      Icons.list_alt,
                      'Kuesioner',
                      KuisionerScreen(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildGridButton(
                      context,
                      Icons.psychology,
                      'Meditasi',
                      MeditasiScreen(),
                    ),
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
                    _buildArticleCard(
                      'Apa Itu Kecemasan?',
                      'Perasaan cemas yang dialami dapat\ndicegah dan diatasi',
                    ),
                    _buildArticleCard(
                      'Cara Mengatasi Kecemasan',
                      'Pelajari beberapa cara untuk\nmengurangi kecemasan',
                    ),
                    _buildArticleCard(
                      'Apa Itu meditasi?',
                      'Teknik menjernihkan pikiran untuk\nmempertajam fokus',
                    ),
                    _buildArticleCard(
                      'Pentingnya Meditasi',
                      'Meditasi sebagai metode untuk\nmengelola kecemasan',
                    ),
                    _buildArticleCard(
                      'Apa Itu Serangan Panik?',
                      'Serangan panik adalah perasaan\ntakut dan cemas yang sangat hebat.',
                    ),
                    _buildArticleCard(
                      'Apa penyebab serangan panik?',
                      'Cemas, stress, dan pengalaman mengerikan',
                    ),
                    _buildArticleCard(
                      'Apa Itu Anxiety Disorder?',
                      'Anxiety disorder adalah masalah\nkejiwaan berupa gangguan kecemasan.',
                    ),
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

  // Greeting and Emotion Section
  Widget _buildGreetingSection() {
    String greeting = _getGreetingMessage();
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(43, 68, 63, 144), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      padding: EdgeInsets.all(16), // Padding inside the container
      margin: EdgeInsets.symmetric(vertical: 10), // Margin outside the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Bagaimana perasaanmu?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildEmotionIcon(Icons.sentiment_dissatisfied, 'sedih'),
              _buildEmotionIcon(Icons.sentiment_neutral, 'biasa saja'),
              _buildEmotionIcon(Icons.sentiment_satisfied, 'senang'),
              _buildEmotionIcon(Icons.sentiment_very_satisfied, 'sangat senang'),
            ],
          ),
        ],
      ),
    );
  }

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi!';
    } else if (hour < 18) {
      return 'Selamat Siang!';
    } else {
      return 'Selamat Malam!';
    }
  }

  // Emotion Icon Widget
  Widget _buildEmotionIcon(IconData icon, String emotion) {
    bool isSelected = selectedEmotion == emotion; // Check if the emotion is selected
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedEmotion = emotion; // Update the selected emotion
        });
        print('Clicked on $emotion');
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: isSelected ? 50 : 40, // Change size if selected
            color: isSelected ? Color.fromARGB(255, 68, 63, 144) : Colors.black, // Change color if selected
          ),
          SizedBox(height: 5),
          Text(emotion),
        ],
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
}
