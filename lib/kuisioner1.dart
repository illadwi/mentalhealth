import 'package:flutter/material.dart';
import 'package:myapp/hasil_kuisioner.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuisionerScreen extends StatefulWidget {
  @override
  _KuisionerScreenState createState() => _KuisionerScreenState();
}

class _KuisionerScreenState extends State<KuisionerScreen> {
  Map<int, int> _answers = {};
  bool _showQuestions = false;
  List<String> _currentQuestions = [];
  String _questionnaireTitle = '';

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
          'Kuisioner',
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
              if (!_showQuestions)
                _buildKuisionerOptions(context)
              else
                _buildQuestions(context),
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

  Widget _buildKuisionerOptions(BuildContext context) {
    return Column(
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
                  setState(() {
                    _showQuestions = true;
                    _currentQuestions = [
                      "1. Kurangnya minat/kesenangan dalam melakukan berbagai hal?",
                      "2. Merasa sedih, tertekan, atau putus asa.",
                      "3. Kesulitan tidur, baik kesulitan untuk tidur, terlalu banyak tidur, atau sering terbangun di malam hari",
                      "4. Merasa lelah atau kurang energi?",
                      "5. Nafsu makan yang buruk atau makan berlebihan",
                      "6. Merasa buruk tentang diri Anda sendiri—atau merasa bahwa Anda gagal atau telah mengecewakan diri sendiri atau keluarga.",
                      "7. Kesulitan berkonsentrasi pada hal-hal, seperti membaca koran atau menonton TV",
                      "8. Bergerak atau berbicara sangat lambat sehingga orang lain mungkin memperhatikan, atau sebaliknya, menjadi sangat gelisah atau cemas sehingga Anda bergerak lebih dari biasanya.",
                      "9. Apakah Anda memiliki pikiran tentang melukai diri sendiri atau merasa lebih baik jika tidak hidup?",
                      "10. Seberapa sering Anda merasa cemas atau takut tanpa alasan yang jelas, dan merasa tidak bisa mengontrol perasaan tersebut?"
                    ];
                    _questionnaireTitle = 'Pertanyaan PHQ-9';
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kuisioner PHQ-9",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
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
                  setState(() {
                    _showQuestions = true;
                    _currentQuestions = [
                      "1. Seberapa sering Anda merasa kesepian atau terasing dari orang lain?",
                      "2. Apakah Anda sering meragukan kemampuan atau nilai diri Anda sendiri?",
                      "3. Seberapa sering Anda merasa tidak bahagia atau tidak puas dengan hidup Anda?",
                      "4. Apakah Anda mengalami perubahan dalam cara Anda menjalani aktivitas sehari-hari, seperti lebih banyak beristirahat atau menghindari tanggung jawab?",
                      "5. Apakah Anda merasa seperti tidak diterima oleh orang-orang di sekitar Anda?",
                      "6. Seberapa sering Anda merasa putus asa mengenai masa depan Anda?",
                      "7. Apakah Anda merasa kesulitan dalam membuat keputusan kecil atau besar dalam hidup Anda?",
                      "8. Seberapa sering Anda merasa tidak memiliki energi untuk melakukan aktivitas sehari-hari?",
                      "9. Apakah Anda merasa tertekan oleh kewajiban atau tanggung jawab yang harus Anda lakukan?",
                      "10. Apakah Anda menghindari kegiatan atau hobi yang biasanya Anda nikmati?"
                    ];
                    _questionnaireTitle = 'Pertanyaan Depresi';
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kuisioner Depresi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            _questionnaireTitle,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        ..._currentQuestions.asMap().entries.map((entry) {
          int index = entry.key;
          String question = entry.value;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(43, 68, 63, 144),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color.fromARGB(255, 68, 63, 144),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: [
                    RadioListTile<int>(
                      value: 0,
                      groupValue: _answers[index],
                      onChanged: (value) {
                        setState(() {
                          _answers[index] = value!;
                        });
                      },
                      title: Text("Tidak Pernah"),
                    ),
                    RadioListTile<int>(
                      value: 1,
                      groupValue: _answers[index],
                      onChanged: (value) {
                        setState(() {
                          _answers[index] = value!;
                        });
                      },
                      title: Text("Pernah"),
                    ),
                    RadioListTile<int>(
                      value: 2,
                      groupValue: _answers[index],
                      onChanged: (value) {
                        setState(() {
                          _answers[index] = value!;
                        });
                      },
                      title: Text("Sering"),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () async {
              int totalScore =
                  _answers.values.fold(0, (sum, value) => sum + (value));
              await _saveResults(totalScore); // Save questionnaire results
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HasilKuisionerScreen(totalScore: totalScore),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 68, 63, 144),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text('Kirim', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Future<void> _saveResults(int totalScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('kuisioner_history') ?? [];

    // Create a string for each question and its corresponding answer
    StringBuffer results = StringBuffer();
    for (int i = 0; i < _currentQuestions.length; i++) {
      String question = _currentQuestions[i];
      int? answer = _answers[i];
      String answerText = answer != null
          ? (answer == 0
              ? 'Tidak Pernah'
              : answer == 1
                  ? 'Pernah'
                  : 'Sering')
          : 'Belum Dijawab';

      results.write('$question: $answerText\n');
    }

    // Save the score and detailed results
    history.add('Score: $totalScore\n$results on ${DateTime.now()}');
    await prefs.setStringList('kuisioner_history', history);
  }
}
