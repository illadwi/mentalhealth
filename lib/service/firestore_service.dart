import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> tambahData(String koleksi, Map<String, dynamic> data) async {
    await _db.collection(koleksi).add(data);
  }

  Future<void> perbaruiData(String koleksi, String id, Map<String, dynamic> data) async {
    await _db.collection(koleksi).doc(id).update(data);
  }

  Future<void> hapusData(String koleksi, String id) async {
    await _db.collection(koleksi).doc(id).delete();
  }

  Stream<QuerySnapshot> dapatkanData(String koleksi) {
    return _db.collection(koleksi).snapshots();
  }
}
