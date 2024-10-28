import 'package:flutter/material.dart';
import 'package:myapp/hasil_kuisioner.dart';
import 'package:myapp/home_screen.dart';

class KuisionerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ), // Navigate to HomeScreen
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color.fromARGB(255, 68, 63, 144),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Increased SizedBox height to move "Kuesioner" lower
                    SizedBox(height: 60), // Add additional spacing here
                    Text(
                      'Kuisioner PHQ-9',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 68, 63, 144),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0), // Add spacing after the header
                // Questionnaire Section
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(43, 68, 63, 144),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pertanyaan PHQ-9',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Selama dua minggu terakhir, seberapa sering Anda terganggu oleh masalah berikut?',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 12),
                      // Questions
                      ..._buildQuestions(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Submit Button
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HasilKuisionerScreen()));
                      // Add your submit functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 68, 63,
                          144), // Use backgroundColor instead of primary
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child:
                        Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildQuestions() {
    final questions = [
      "1. Kurangnya minat/kesenangan dalam melakukan berbagai hal?",
      "2. Merasa sedih, tertekan, atau putus asa.",
      "3. Kesulitan tidur, baik kesulitan untuk tidur, terlalu banyak tidur, atau sering terbangun di malam hari",
      "4. Merasa lelah atau kurang energi?",
      "5. Nafsu makan yang buruk atau makan berlebihan",
      "6. Merasa buruk tentang diri Anda sendiri—atau merasa bahwa Anda gagal atau telah mengecewakan diri sendiri atau keluarga.",
      "7. Kesulitan berkonsentrasi pada hal-hal, seperti membaca koran atau menonton TV",
      "8. Bergerak atau berbicara sangat lambat sehingga orang lain mungkin memperhatikan, atau sebaliknya, menjadi sangat gelisah atau cemas sehingga Anda bergerak lebih dari biasanya.",
    ];
    return questions.map((question) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              '0: Tidak Pernah',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              '1: Pernah',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              '2: Sering',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(height: 5),
          ],
        ),
      );
    }).toList();
  }
}
