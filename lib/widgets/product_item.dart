import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../barrels/localizations.dart';
import '../barrels/resources.dart';
import '../barrels/models.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.4167),
        boxShadow: [
          const BoxShadow(
            color: Color(0x1A4D5877),
            offset: Offset(2, 3),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.images?.first ?? ''),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(product.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.productTitleStyle,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Visibility(
                        visible: product.regularPrice != null && product.regularPrice!.isNotEmpty && product.regularPrice != product.price,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("\$" + product.regularPrice!,
                            style: TextStyles.productInfoStyle.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ),

                      Text("\$" + product.price!,
                        style: TextStyles.productPriceStyle,
                      ),
                    ],
                  ),

                  Text(product.totalSale!.toString() + ' ' + STR_SOLD.tr,
                    style: TextStyles.productInfoStyle.copyWith(
                      fontSize: 14.42,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
