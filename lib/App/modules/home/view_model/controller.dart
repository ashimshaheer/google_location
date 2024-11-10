import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../Helpers/service.dart';
import '../../../utils/enums.dart';
import '../model/product_model.dart';

class HomeController extends ChangeNotifier {
  Product producs = Product();
  ProductStatus productStatus = ProductStatus.initial;
  Future<void> getProductsFn() async {
    try {
      productStatus = ProductStatus.initial;
      List response = await ServerClient.get('https://fake-store-api.mock.beeceptor.com/api/products');
      log("recommended response: ${response.first} :  ${response.last}");
      if (response.first >= 200 && response.first < 300) {
        producs = Product.fromJson(response.last);

        productStatus = ProductStatus.loaded;
      } else {
        productStatus = ProductStatus.error;
      }
    } catch (e) {
      productStatus = ProductStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
