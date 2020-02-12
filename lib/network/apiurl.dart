import 'package:casestoreapp/model/promoModel.dart';
import 'package:http/http.dart' as http;

class ApiUrl {
  final String baseUrl = "http://156.67.217.225/apinative/api/";
  Future<List<PromoModel>> getPromo() async {
    final response = await http.get("$baseUrl/getPromo.php");
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }
  // Future<List<ProdukModel>> getProduk() async {
  //   final response = await http.get("$baseUrl/getProduct.php");
  //   if (response.statusCode == 200) {
  //     return produkFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

 
}
class ApiGetProduk {
   static String url = "http://156.67.217.225/apinative/api/";
  static String getProduk() {
    return "$url/getProduct.php";
  } 
}