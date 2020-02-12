import 'dart:convert';

class PromoModel {
  final String idpromo;
  final String namepromo;
  final String status;
  final String urlimg;
  final String urlimg2;
  final String urlimg3;
  final String urlimg4;


  PromoModel({
    this.idpromo,
    this.namepromo,
    this.status,
    this.urlimg,
    this.urlimg2,
    this.urlimg3,
    this.urlimg4});

factory PromoModel.fromJson(Map<String, dynamic> json){
  return PromoModel(
    idpromo: json['idpromo'],
    namepromo: json['namepromo'],
    status: json['status'],
    urlimg: json['urlimg'],
    urlimg2: json['urlimg2'],
    urlimg3: json['urlimg3'],
    urlimg4: json['urlimg4']
  );
}
Map<String, dynamic> toJson() {
    return {
      "idpromo": idpromo,
      "namepromo": namepromo,
      "status": status,
      "urlimg": urlimg,
      "urlimg2": urlimg2,
      "urlimg3": urlimg3,
      "urlimg4": urlimg4,
      

    };
  }

  @override
  String toString() {
    return 'PromoModel{idpromo: $idpromo, namepromo: $namepromo, status: $status, urlimg: $urlimg,urlimg2: $urlimg2,urlimg3: $urlimg3,urlimg4: $urlimg4  }';
  }
}

List<PromoModel> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<PromoModel>.from(
      data.map((item) => PromoModel.fromJson(item)));
}

String profileToJson(PromoModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


