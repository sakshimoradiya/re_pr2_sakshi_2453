import 'dart:developer';

import 'package:flutter/material.dart';

import '../helpers/products_helper.dart';
import '../modal/product.dart';

class ProductController extends ChangeNotifier {
  List<ProductModal> allProducts = <ProductModal>[];
  Future<List<ProductModal>> getAllProducts() async {
    allProducts = (await ProductsHelper.productsHelper.getProducts())!;
    log("$allProducts");
    return allProducts;
    notifyListeners();
  }
}
