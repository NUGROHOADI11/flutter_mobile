import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:modul/model/product.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  Future fetchProducts() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.spoonacular.com/food/menuItems/search?apiKey=8be7d2bf2b564fde8b622c2057970916&query=sushi&number=5'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData.containsKey("menuItems")) {
          final data = responseData["menuItems"] as List<dynamic>;

          products.assignAll(data
              .map((element) => Product(
                    id: element['id'],
                    title: element['title'],
                    image: element['image'],
                    imageType: element['imageType'],
                    restaurantChain: element['restaurantChain'],
                    servings: Servings(
                      number: element['servings']['number'],
                      size: element['servings']['size'],
                      unit: element['servings']['unit'],
                    ),
                  ))
              .toList());
        } else {
          throw Exception("Menu items not found in the API response.");
        }
      } else {
        throw Exception(
            "Failed to load product data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
