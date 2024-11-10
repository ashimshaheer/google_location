import 'package:flutter/material.dart';

import '../../../utils/extentions.dart';
import '../../../utils/size_box.dart';
import '../../home/widgets/product_widgets.dart';
import 'dot_widgets.dart';

class ProductDetailProductImageWidget extends StatelessWidget {
  const ProductDetailProductImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            width: Responsive.width * 100,
            child: Stack(
              children: [
                SizedBox(
                  width: Responsive.width * 100,
                  height: Responsive.height * 32,
                  child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: (value) {},
                    itemBuilder: (context, index) {
                      return const CachedImageWidget(imageUrl: '' ?? "");
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: OfferTagWidget(
                    offer: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizeBoxH(15),
          const DotListWidget(
            productDetailsImages: [],
            isProductDetails: true,
          ),
          const SizeBoxH(15),
        ],
      ),
    );
  }
}
