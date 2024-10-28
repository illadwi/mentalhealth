import 'package:flutter/material.dart';
import '../model/meditasi_model.dart';

class MeditasiScreen extends StatelessWidget {
  final List<MeditasiModel> meditasiList = [
    // Data dummy
    MeditasiModel(
        judul: 'Meditasi Relaksasi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditasi'),
      ),
      body: ListView.builder(
        itemCount: meditasiList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(meditasiList[index].judul),
            onTap: () {},
          );
        },
      ),
    );
  }
}
