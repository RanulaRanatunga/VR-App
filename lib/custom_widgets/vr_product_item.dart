import 'package:flutter/material.dart';
import 'package:vr_ui/models/vr_product_model.dart';
import 'package:vr_ui/pages/product_detail_page.dart';

class VRProductItem extends StatelessWidget {
  final List<VRProduct>? vrProductList;
  final int index;

  const VRProductItem(
      {Key? key, required this.index, required this.vrProductList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.network(vrProductList![index].images),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vrProductList![index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(vrProductList![index].price),
                    ],
                  )
                ],
              ),
          
          ),
        ),
        InkWell(
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(15)),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductDetailPage()));
          },
        )
      ],
    );
  }
}
