import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grogentask/App/utils/app_images.dart';
import 'package:grogentask/App/utils/common_widgets.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../../../utils/size_box.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  const CachedImageWidget({super.key, required this.imageUrl, this.height = 0, this.width = 0, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: SizedBox(
          height: height > Responsive.height * 50 ? 35 : height,
          width: width > Responsive.height * 50 ? 35 : width,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.asset(
          AppImages.splashLogo,
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
    );
  }
}

class OfferTagWidget extends StatelessWidget {
  final num offer;
  const OfferTagWidget({super.key, this.offer = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 24,
      decoration: const ShapeDecoration(
        color: Color(0xFFDB3022),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      child: Center(
        child: CommonTextWidget(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600, text: "$offer%"),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final bool withCart;

  final String? product;

  const ProductWidget({
    super.key,
    this.withCart = true,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.027),
          blurRadius: .02,
          offset: const Offset(5, -9),
          spreadRadius: .02,
        )
      ]),
      child: Column(
        children: [
          Container(
            width: Responsive.width * 40,
            height: 112,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ),
            child: const CachedImageWidget(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                imageUrl: ''),
          ),
          Container(
            width: Responsive.width * 40,
            height: Responsive.height * 15,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9FB),
              border: Border(
                  bottom: BorderSide(
                color: Colors.black.withOpacity(.028),
              )),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      text: 'aaaaaaaaaaaaaaaaaaaa'),
                  SizeBoxH(5),
                  CommonTextWidget(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    text: 'aaaaaaaaa',
                  ),
                  SizeBoxH(5),
                  Row(
                    children: [
                      CommonTextWidget(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                        text: '300',
                        // '${currency ?? ''} ${currencyIcon ?? ''}${product?.discountPrice?.toStringAsFixed(2) ?? ""}',
                      ),
                      Expanded(
                        child: CommonTextWidget(
                          color: Color(0xFF8390A1),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          text: '10000',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xFFFFC732),
                      ),
                      SizeBoxV(5),
                      CommonTextWidget(
                          fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600, height: 0, text: 'aaaaaaa'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.height * 6, // Set the height of the container
      padding: const EdgeInsets.symmetric(horizontal: 16), // Optional padding
      decoration: BoxDecoration(
        color: Colors.white, // White background color
        borderRadius: BorderRadius.circular(16), // Optional rounded corners
      ),
      child: Center(
        child: TextField(
          controller: TextEditingController(),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: const InputDecoration(
            hintText: "Search", // Hint text
            border: InputBorder.none, // No border
          ),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
