// ignore_for_file: must_be_immutable

import 'package:apps/Service/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  int id;
  ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Future singleProduct;
  @override
  void initState() {
    singleProduct = ProductService().getSingleProducts(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: singleProduct,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    snapshot.data['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    child: Image.network(snapshot.data['image']),
                  ),
                  Text(
                    snapshot.data['price'].toString(),
                  ),
                  Text(
                    snapshot.data['description'].toString(),
                  ),
                  Text(
                    snapshot.data['category'].toString(),
                  ),
                  Text(
                    snapshot.data['rating'].toString(),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}
