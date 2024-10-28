import 'package:flutter/material.dart';
import 'package:myapp/setting.dart';

class AkunScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingScreen()));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color.fromARGB(255, 68, 63, 144),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Akun',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 68, 63, 144),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                _buildTextField('Nama', 'Benaya', false),
                _buildTextField('Email', 'benaya@mail.com', false),
                _buildTextField('Kata Sandi', 'benaya123456', true),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white), // Text color white
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 68, 63, 144), // Button color
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            ),
            controller: TextEditingController(text: initialValue),
          ),
        ],
      ),
    );
  }
}
