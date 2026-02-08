class KaryawanModel {
  final String id;
  final String nama;

  KaryawanModel({required this.id, required this.nama});

  factory KaryawanModel.fromJson(Map<String, dynamic> json) => KaryawanModel(
        id: json['id'].toString(),
        nama: json['nama']?.toString() ?? 'Tanpa Nama',
      );

  @override
  String toString() => nama;

  // --- PERBAIKAN: Agar Dropdown bisa mendeteksi item terpilih ---
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KaryawanModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class WaterLevelMaster {
  final String id;
  final String id_lokasi;
  final String no_wl;
  final String latitude;
  final String longitude;

  WaterLevelMaster({
    required this.id,
    required this.id_lokasi,
    required this.no_wl,
    required this.latitude,
    required this.longitude,
  });

  factory WaterLevelMaster.fromJson(Map<String, dynamic> json) =>
      WaterLevelMaster(
        id: json['id'].toString(),
        id_lokasi: json['id_lokasi']?.toString() ?? '',
        no_wl: json['no_wl']?.toString() ?? '',
        latitude: json['latitude']?.toString() ?? '',
        longitude: json['longitude']?.toString() ?? '',
      );

  @override
  String toString() => '$no_wl (Lat: $latitude, Long: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaterLevelMaster && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class InfrastructureMaster {
  final String id;
  final String id_lokasi;
  final String id_object;
  final String category;
  final String latitude;
  final String longitude;

  InfrastructureMaster({
    required this.id,
    required this.id_lokasi,
    required this.id_object,
    required this.category,
    required this.latitude,
    required this.longitude,
  });

  factory InfrastructureMaster.fromJson(Map<String, dynamic> json) =>
      InfrastructureMaster(
        id: json['id'].toString(),
        id_lokasi: json['id_lokasi']?.toString() ?? '',
        id_object: json['id_object']?.toString() ?? '',
        category: json['category']?.toString() ?? '',
        latitude: json['latitude']?.toString() ?? '',
        longitude: json['longitude']?.toString() ?? '',
      );

  @override
  String toString() => '$id_object - $category';

  // --- PERBAIKAN: Agar Dropdown bisa mendeteksi item terpilih ---
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InfrastructureMaster && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class LokasiModel {
  final String id;
  final String afdeling;
  final String blok;

  LokasiModel({required this.id, required this.afdeling, required this.blok});

  factory LokasiModel.fromJson(Map<String, dynamic> json) => LokasiModel(
        id: json['id'].toString(),
        afdeling: json['afdeling']?.toString() ?? '',
        blok: json['blok']?.toString() ?? '',
      );
  
  @override
  String toString() => 'Afd $afdeling - Blok $blok';

  // --- PERBAIKAN: Agar Dropdown bisa mendeteksi item terpilih ---
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LokasiModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class SkoringConfig {
  final String unit;
  final String parameter;
  final String? labelKondisi;
  final double? minValue;
  final double? maxValue;
  final int skor;

  SkoringConfig({
    required this.unit,
    required this.parameter,
    this.labelKondisi,
    this.minValue,
    this.maxValue,
    required this.skor,
  });

  factory SkoringConfig.fromJson(Map<String, dynamic> json) {
    return SkoringConfig(
      unit: json['unit']?.toString() ??
          json['tipe_objek']?.toString() ??
          json['category']?.toString() ??
          'UNKNOWN',
      parameter: json['kategori_parameter']?.toString() ??
          json['parameter']?.toString() ??
          '',
      labelKondisi: json['label_kondisi']?.toString(),
      minValue: json['min_value'] != null
          ? double.tryParse(json['min_value'].toString())
          : null,
      maxValue: json['max_value'] != null
          ? double.tryParse(json['max_value'].toString())
          : null,
      skor: int.tryParse(json['skor'].toString()) ?? 0,
    );
  }
}