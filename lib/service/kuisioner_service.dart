import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/kuisioner_model.dart';
import 'firestore_service.dart';

class KuisionerService {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> tambahKuesioner(KuisionerModel kuisioner) async {
    await _firestoreService.tambahData('kuisioner', kuisioner.toJson());
  }

  Future<void> perbaruiKuisioner(String id, KuisionerModel kuisioner) async {
    await _firestoreService.perbaruiData('kuisioner', id, kuisioner.toJson());
  }

  Stream<QuerySnapshot> dapatkanKuisioner() {
    return _firestoreService.dapatkanData('kuisioner');
  }
}
