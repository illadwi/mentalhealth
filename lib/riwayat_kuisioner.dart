import 'package:flutter/material.dart';
import 'package:myapp/setting.dart';

class RiwayatKuisionerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Riwayat Kuisioner'), shadowColor: Color.fromARGB(255, 68, 63, 144),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), color: Color.fromARGB(255, 68, 63, 144),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingScreen()));
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HistoryCard(date: 'Hari ini', description: 'Depresi PHQ-9'),
                HistoryCard(date: 'Kemarin', description: 'Kecemasan GAD-7'),
                HistoryCard(
                    date: 'Rabu, 9 Oktober 2024',
                    description: 'Kecemasan GAD-7'),
                HistoryCard(
                    date: 'Kamis, 3 Oktober 2024',
                    description: 'Kecemasan GAD-7'),
                HistoryCard(
                    date: 'Jumat, 4 Oktober 2024',
                    description: 'Kecemasan GAD-7'),
                // Add more cards as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String date;
  final String description;

  const HistoryCard({required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: 16.0, right: 16.0), // Adjust margin for right spacing
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(43, 68, 63, 144),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
