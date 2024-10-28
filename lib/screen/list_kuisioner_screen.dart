import 'package:flutter/material.dart';
import '../component/item_kuisioner.dart';
import '../model/kuisioner_model.dart';

class ListKuisionerScreen extends StatelessWidget {
  final List<KuisionerModel> kuisionerList = [
    // Data dummy
    KuisionerModel(id: '1', judul: 'Cek Kesehatan Mental', pertanyaan: ['Q1', 'Q2']),
    KuisionerModel(id: '2', judul: 'Tes Tingkat Stres', pertanyaan: ['Q1', 'Q2']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kuisioner'),
      ),
      body: ListView.builder(
        itemCount: kuisionerList.length,
        itemBuilder: (context, index) {
          return ItemKuisioner(kuisioner: kuisionerList[index]);
        },
      ),
    );
  }
}
