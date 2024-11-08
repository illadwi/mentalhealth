import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/meditasi.dart';
import 'package:myapp/setting.dart';

class YogaScreen extends StatelessWidget {
  const YogaScreen({super.key});

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
          'Yoga',
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
              _buildYogaOption(context, "5 Menit", Icons.access_time, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerScreen(duration: 5),
                  ),
                );
              }),
              _buildYogaOption(context, "10 Menit", Icons.access_time, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerScreen(duration: 10),
                  ),
                );
              }),
              _buildYogaOption(context, "20 Menit", Icons.access_time, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerScreen(duration: 20),
                  ),
                );
              }),
              _buildYogaOption(context, "30 Menit", Icons.access_time, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerScreen(duration: 30),
                  ),
                );
              }),
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

  Widget _buildYogaOption(
      BuildContext context, String label, IconData icon, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: Color.fromARGB(43, 68, 63, 144),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Icon(icon, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final int duration; // Durasi dalam menit

  const TimerScreen({Key? key, required this.duration}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late int remainingSeconds;
  Timer? _timer;
  bool isRunning = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  double volume = 0.5; // Volume awal

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.duration * 60;
    _audioPlayer.setVolume(volume);
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    // Memulai pemutaran musik dari file asset saat timer dimulai
    _audioPlayer.play(AssetSource('sound/musik.mp3'), volume: volume);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          _audioPlayer.stop();
          isRunning = false;
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _audioPlayer.pause(); // Menghentikan musik saat timer dihentikan
    setState(() {
      isRunning = false;
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      remainingSeconds = widget.duration * 60;
    });
  }

  void toggleTimer() {
    if (isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void increaseVolume() {
    setState(() {
      volume = (volume + 0.1).clamp(0.0, 1.0); // Meningkatkan volume
      _audioPlayer.setVolume(volume);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  String get timerText {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 68, 63, 144),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Yoga - ${widget.duration} Menit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 68, 63, 144),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Konten utama
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Duduk tenang, pejamkan mata, tarik napas dalam, dan fokus pada keheningan tanpa merespon pikiran yang muncul.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      Text(
                        timerText,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Icon(
                        Icons.access_time,
                        size: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.refresh, size: 40),
                        onPressed: resetTimer, // Menambahkan fungsi reset
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: toggleTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 68, 63, 144),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(isRunning ? 'Pause' : 'Play'),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.volume_up, size: 40),
                        onPressed: increaseVolume, // Meningkatkan volume
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Icon(
                      Icons.home,
                      color: Color.fromARGB(43, 68, 63, 144),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                    },
                    child: Icon(
                      Icons.settings,
                      color: Color.fromARGB(43, 68, 63, 144),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
