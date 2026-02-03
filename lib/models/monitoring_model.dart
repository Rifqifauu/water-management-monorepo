
class KaryawanModel {
  final String id;
  final String nama;
  KaryawanModel({required this.id, required this.nama});
  factory KaryawanModel.fromJson(Map<String, dynamic> json) => 
      KaryawanModel(
        id: json['id'].toString(), 
        nama: json['nama']?.toString() ?? 'Tanpa Nama'
      );
  
  @override
  String toString() => nama;
}

class LokasiModel {
  final String id;
  final String afdeling;
  final String blok;
  LokasiModel({required this.id, required this.afdeling, required this.blok});
  factory LokasiModel.fromJson(Map<String, dynamic> json) => LokasiModel(
    id: json['id'].toString(), 
    afdeling: json['afdeling']?.toString() ?? '', 
    blok: json['blok']?.toString() ?? ''
  );
}

class SkoringConfig {
  final String unit;
  final String parameter;
  final String? labelKondisi;
  final double? minValue;
  final double? maxValue;
  final int skor;

  SkoringConfig({
    required this.unit, required this.parameter, this.labelKondisi,
    this.minValue, this.maxValue, required this.skor,
  });

  factory SkoringConfig.fromJson(Map<String, dynamic> json) {
    return SkoringConfig(
      unit: json['unit']?.toString() ?? 
            json['tipe_objek']?.toString() ?? 
            json['category']?.toString() ??
            'UNKNOWN',
            
      parameter: json['kategori_parameter']?.toString() ?? json['parameter']?.toString() ?? '',
      labelKondisi: json['label_kondisi']?.toString(),
      
      minValue: json['min_value'] != null ? double.tryParse(json['min_value'].toString()) : null,
      maxValue: json['max_value'] != null ? double.tryParse(json['max_value'].toString()) : null,
      skor: int.tryParse(json['skor'].toString()) ?? 0,
    );
  }
}