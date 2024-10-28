import 'package:flutter/material.dart';
import '../model/kuisioner_model.dart';

class ItemKuisioner extends StatelessWidget {
  final KuisionerModel kuisioner;

  ItemKuisioner({required this.kuisioner});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(kuisioner.judul),
      subtitle: Text('Jumlah Pertanyaan: ${kuisioner.pertanyaan.length}'),
    );
  }
}
