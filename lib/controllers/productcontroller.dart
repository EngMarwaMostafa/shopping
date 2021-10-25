import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List.generate(1000, (index) => null)<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}