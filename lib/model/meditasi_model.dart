import 'package:cloud_firestore/cloud_firestore.dart';

class MeditasiModel {
  final String judul;

  MeditasiModel({
    required this.judul,
  });

  Map<String, dynamic> toJson() => {
        'judul': judul,  
      };

  static MeditasiModel fromJson(Map<String, dynamic> json) => MeditasiModel(
        judul: json['judul'],
      
      );

  factory MeditasiModel.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>>json) {
      return MeditasiModel(judul:json['judul']);
    }
  
}

