class ScheduleModel {
  String? waktuMulai;
  String? waktuSelesai;
  String? namaRuangan;

  ScheduleModel({
    this.waktuMulai,
    this.waktuSelesai,
    this.namaRuangan,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        waktuMulai: json["waktu_mulai"],
        waktuSelesai: json["waktu_selesai"],
        namaRuangan: json["nama_ruangan"],
      );

  Map<String, dynamic> toJson() => {
        "waktu_mulai": waktuMulai,
        "waktu_selesai": waktuSelesai,
        "nama_ruangan": namaRuangan,
      };
}
