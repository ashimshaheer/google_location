import 'package:flutter/material.dart';

import '../../../utils/extentions.dart';
import '../../../utils/size_box.dart';

class DotListWidget extends StatelessWidget {
  final bool isProductDetails;
  final List<dynamic>? carousalBaanner;
  final List<String>? productDetailsImages;
  const DotListWidget({super.key, this.isProductDetails = false, this.carousalBaanner, this.productDetailsImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 8,
        width: Responsive.width * 100,
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const DotWidget(color: Colors.black);
            },
            separatorBuilder: (context, index) => const SizeBoxV(8),
            itemCount: isProductDetails == true ? productDetailsImages?.length ?? 0 : carousalBaanner?.length ?? 0,
          ),
        ));
  }
}

class DotWidget extends StatelessWidget {
  final Color color;
  const DotWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
