import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Icon
                (Icons.shopping_bag,
                color: Colors.white,)],
            ),
          )
        ],
      ),

 body: SingleChildScrollView(
  child:Column (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 200,
        
      )
    ],
  ),),

    );
  }
}
