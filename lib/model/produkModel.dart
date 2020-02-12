import 'dart:convert';

class ProdukModel {
  final String id;
  final String nama;
  final String harga;
  final String stok;
  final String detail;
  final String urlimg;


  ProdukModel({
    this.id,
    this.nama,
    this.harga,
    this.stok,
    this.detail,
    this.urlimg,
    });

factory ProdukModel.fromJson(Map<String, dynamic> json){
  return ProdukModel(
    id: json['id'],
    nama: json['nama'],
    harga: json['harga'],
    stok: json['stok'],
    detail: json['detail'],
    urlimg: json['urlimg'],
  );
}
Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "harga": harga,
      "stok": stok,
      "detail": detail,
      "urlimg": urlimg,
      

    };
  }

  @override
  String toString() {
    return 'ProdukModel{id: $id, nama: $nama, harga: $harga, stok: $stok, detail: $detail,urlimg: $urlimg}';
  }
}

List<ProdukModel> produkFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ProdukModel>.from(
      data.map((item) => ProdukModel.fromJson(item)));
}

String produkToJson(ProdukModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


