import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future getProducts() async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products');
    final Response = await http.get(productUrl);
    //print(Response.statusCode);
    //print(Response.body);
    return json.decode(Response.body);
  }

  Future getSingleProducts(int id) async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final Response = await http.get(productUrl);
    //print(Response.statusCode);
    //print(Response.body);
    return json.decode(Response.body);
  }
}
