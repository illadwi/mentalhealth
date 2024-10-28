import 'package:flutter/material.dart';
import '../model/meditasi_model.dart';
import '../service/firestore_service.dart';

class TambahMeditasiScreen extends StatefulWidget {
  @override
  _TambahMeditasiScreenState createState() => _TambahMeditasiScreenState();
}

class _TambahMeditasiScreenState extends State<TambahMeditasiScreen> {
  final _judulController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void dispose() {
    _judulController.dispose();
    super.dispose();
  }

  void _tambahMeditasi() async {
    if (_judulController.text.isNotEmpty ) {
      final meditasiBaru = MeditasiModel(
        judul: _judulController.text
      );

      await _firestoreService.tambahData('meditasi', meditasiBaru.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Meditasi berhasil ditambahkan!')),
      );

      Navigator.pop(context); // Kembali ke layar sebelumnya setelah menambahkan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambahkan Meditasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: InputDecoration(labelText: 'Judul Meditasi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _tambahMeditasi,
              child: Text('Tambahkan Meditasi'),
            ),
          ],
        ),
      ),
    );
  }
}
