import 'package:flutter/material.dart';
import 'package:grogentask/App/utils/common_widgets.dart';
import 'package:grogentask/App/utils/extentions.dart';
import 'package:grogentask/App/utils/size_box.dart';

class ProdcutDetails extends StatelessWidget {
  const ProdcutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Responsive.width * 100,
        height: Responsive.height * 100,
        color: Colors.lightBlue,
        child: Column(
          children: [
            SizeBoxH(Responsive.height * 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizeBoxH(Responsive.height * 30),
            Container(
              width: Responsive.width * 100,
              height: Responsive.height * 62,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizeBoxH(Responsive.height * 10),
                  Container(
                    decoration:
                        const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: const CommonTextWidget(
                      color: Colors.white,
                      text: 'gjandjfziha.guihi',
                      fontSize: 16,
                    ),
                  ),
                  const Row(
                    children: [
                      CommonTextWidget(
                        color: Colors.black,
                        text: 'Baby orange imported',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      CommonTextWidget(
                        color: Colors.black,
                        text: '  (Baby orange)',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const CommonTextWidget(
                    color: Colors.grey,
                    text: 'laguts',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
