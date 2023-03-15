import 'package:dio/dio.dart';
import 'package:stem_flutter/models/products.dart';

class DioClient {
  final _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  // Future<dynamic> getProducts() async {
  Future<ProductsModel?> getProducts() async {
    final res = await _dio.get('/products');
    if (res.statusCode == 200) {
      // return res.data;
      return ProductsModel.fromJson(res.data);
    }
    return null;
  }
}
