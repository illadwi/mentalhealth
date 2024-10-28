import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/riwayat_kuisioner.dart';
import 'package:myapp/setting.dart';

class HasilKuisionerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0), // Add padding at the top
                child: Row(
                  children: [
                    // Back button with Navigator
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 24),
                      color: Color.fromARGB(255, 68, 63, 144),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Hasil Kuesioner',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 68, 63, 144)),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              // Centered Result Title
              Center(
                child: Column(
                  children: [
                    Text(
                      'Hasil Kuesioner Depresi',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 4), // Optional spacing
                    Text(
                      'Ini adalah hasil yang anda dapatkan',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Result List
              Expanded(
                child: ListView(
                  children: [
                    _buildResultItem('Depresi sangat Berat', '20-27'),
                    _buildDivider(),
                    _buildResultItem('Depresi Berat', '15-19'),
                    _buildDivider(),
                    _buildResultItem('Depresi Sedang', '10-14'),
                    _buildDivider(),
                    _buildResultItem('Depresi Ringan', '5-9'),
                    _buildDivider(),
                    _buildResultItem('Minimal Depresi', '0-4'),
                    _buildDivider(),
                  ],
                ),
              ),
              // Message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Tingkat Depresi anda tergolong ringan, buka Tips Managemen Stres untuk mendapatkan Informasi Penanganan.',
                  textAlign: TextAlign.center,
                ),
              ),
              // Finish Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RiwayatKuisionerScreen()));
                    // Add your finish functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 68, 63, 144),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Selesai', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50, // Reduce the height of the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24,
                  color: Color.fromARGB(43, 68, 63, 144),
                ), // Adjust icon size
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  // Add your home button functionality here
                },
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    size: 24,
                    color: Color.fromARGB(43, 68, 63, 144)), // Adjust icon size
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScreen()));
                  // Add your settings button functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultItem(String label, String range) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(range),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.black,
      thickness: 1,
    );
  }
}
