import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stem_flutter/dio_client.dart';
import 'package:stem_flutter/models/products.dart';

import 'widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _dio = DioClient();

  final _searchController = TextEditingController();

  // String _searchText = '';

  List<ProductModel> _products = [];

  @override
  void initState() {
    _dio.getProducts().then((value) {
      print('Products data: $value');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Flexible(
                        flex: 5,
                        child: TextField(
                          controller: _searchController,
                          // onChanged: (value) {
                          //   setState(() {
                          //     _searchText = value;
                          //   });
                          // },
                        )),
                    ElevatedButton(
                      onPressed: () {
                        final text = _searchController.text;

                        // print('Search: $text');
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              )),
          Flexible(
            flex: 11,
            child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: _products[index]);
              },
            ),
          ),
          // Flexible(
          //   flex: 11,
          //   child: FutureBuilder(
          //     future: _dio.getProducts(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData && snapshot.data != null) {
          //         // return Text('${snapshot.data['products']}');
          //         final products = snapshot.data!.products;

          //         return ListView.builder(
          //           padding: const EdgeInsets.all(4),
          //           itemCount: products?.length ?? 0,
          //           itemBuilder: (context, index) {
          //             return ProductCard(product: products![index]);
          //           },
          //         );
          //       }

          //       return const Center(child: CircularProgressIndicator());
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
