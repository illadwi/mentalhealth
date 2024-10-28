import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UploadGambarService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadGambar(File fileGambar, String path) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = await ref.putFile(fileGambar);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Gagal mengunggah gambar: $e');
    }
  }
}
