import 'package:flutter/material.dart';
import 'package:myapp/akun.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/logout.dart';
import 'package:myapp/riwayat_kuisioner.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 68, 63, 144)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/PROFILE.jpeg'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Benaya',
                          style: TextStyle(
                              color: Color.fromARGB(255, 68, 63, 144),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'benaya@gmail.com',
                          style:
                              TextStyle(color: Color.fromARGB(43, 68, 63, 144)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SettingsItem(
                      icon: Icons.person,
                      title: 'Akun',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AkunScreen()));
                      },
                    ),
                    SettingsItem(
                      icon: Icons.notifications,
                      title: 'Riwayat Kuisioner',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RiwayatKuisionerScreen()),
                        );
                      },
                    ),
                    SettingsItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogoutScreen()),
                        );
                      },
                    ),
                  ],
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
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 68, 63, 144),
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

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
