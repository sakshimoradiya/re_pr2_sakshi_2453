import 'dart:convert';

import 'package:dio/dio.dart';

import '../modal/product.dart';

class ProductsHelper {
  ProductsHelper._();

  static final ProductsHelper productsHelper = ProductsHelper._();

  Dio dio = Dio();
  Future<List<ProductModal>?> getProducts() async {
    String api = "https://dummyjson.com/products";
    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      List alldata = response.data['products'];

      List<ProductModal> allProducts =
          alldata.map((e) => ProductModal.fromMap(data: e)).toList();
      return allProducts;
    } else {
      return null;
    }
  }
}
