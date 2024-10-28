class KuisionerModel {
  final String id;
  final String judul;
  final List<String> pertanyaan;

  KuisionerModel({
    required this.id,
    required this.judul,
    required this.pertanyaan,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'pertanyaan': pertanyaan,
      };

  static KuisionerModel fromJson(Map<String, dynamic> json) =>
      KuisionerModel(
        id: json['id'],
        judul: json['judul'],
        pertanyaan: List<String>.from(json['pertanyaan']),
      );
}
