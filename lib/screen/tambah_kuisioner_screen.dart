import 'package:flutter/material.dart';

class TambahKuisionerScreen extends StatelessWidget {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _pertanyaanController = TextEditingController();
  final List<String> _pertanyaan = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kuisioner'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _pertanyaanController,
              decoration: InputDecoration(labelText: 'Pertanyaan'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_pertanyaanController.text.isNotEmpty) {
                  _pertanyaan.add(_pertanyaanController.text);
                  _pertanyaanController.clear();
                }
              },
              child: Text('Tambahkan Pertanyaan'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _pertanyaan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_pertanyaan[index]),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Simpan data kuisioner ke database
              },
              child: Text('Simpan Kuisioner'),
            ),
          ],
        ),
      ),
    );
  }
}
