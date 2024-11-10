// import 'dart:developer';

// import 'package:flutter/material.dart';

// import '../../../utils/app_constants.dart';
// import '../../../utils/app_images.dart';
// import '../../../utils/common_widgets.dart';
// import '../../../utils/extentions.dart';
// import '../../../utils/size_box.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/loding_overlay.dart';
import '../../../utils/app_images.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/enums.dart';
import '../../../utils/extentions.dart';
import '../../../utils/size_box.dart';
import '../../details/view/prodcut_details.dart';
import '../../map/view/map_screen.dart';
import '../view_model/controller.dart';
import '../widgets/product_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: controller.productStatus == ProductStatus.loading
            ? Center(child: LoadingOverlay.of(context).show())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Responsive.width * 100,
                      height: Responsive.height * 22,
                      decoration: const BoxDecoration(
                        // color: Color(0xFFFF6600),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF6600), // Starting color
                            Color(0xFFFF8A00), // Lighter shade for gradient
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(40, 20),
                          bottomRight: Radius.elliptical(40, 20),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          SizeBoxH(Responsive.height * 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: Responsive.width * 15, // Adjust width as per Responsive.width * 20
                                    height: Responsive.height * 7.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50), // Make it rounded
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.profileIMage), // Replace with your image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget(
                                        color: Colors.white,
                                        text: 'Welcome .',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CommonTextWidget(
                                        color: Colors.white,
                                        text: 'aaaaaaaaaaaa',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                          SizeBoxH(Responsive.height * 1),
                          const SearchField()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: Responsive.height * 2),
                      child: CommonTextWidget(
                        color: Colors.grey[500] ?? Colors.grey,
                        text: 'New Arrivals',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height * 15,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: Responsive.width * 80, // Adjust width as per Responsive.width * 20

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(width: 1, color: Colors.grey[300] ?? Colors.grey), // Make it rounded
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(255, 238, 214, 214).withOpacity(0.2), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 10, // Blur radius
                                      offset: const Offset(5, 5), // Changes position of shadow
                                    ),
                                  ]),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: Responsive.width * 25, // Adjust width as per Responsive.width * 20
                                    height: Responsive.height * 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), // Make it rounded
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.burgerImage), // Replace with your image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: Responsive.height * 1.5,
                                              width: Responsive.width * 10,
                                              decoration: const BoxDecoration(color: Colors.red),
                                              child: const Center(
                                                child: CommonTextWidget(
                                                  color: Colors.white,
                                                  text: '5% OFF',
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizeBoxV(Responsive.width * 5),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const CommonTextWidget(
                                          color: Colors.black,
                                          text: 'Cake Trends',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const Expanded(
                                          child: CommonTextWidget(
                                            color: Colors.black,
                                            text: 'Perfect Cake Delivery',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            overFlow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.green,
                                                child: Center(
                                                    child: Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 15,
                                                )),
                                              ),
                                              CommonTextWidget(
                                                color: Colors.black,
                                                text: '4.1(140)',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizeBoxH(Responsive.height * 0.5),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            CommonTextWidget(
                                              color: Colors.grey,
                                              text: '100',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 1,
                                              overFlow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizeBoxV(Responsive.width * 5),
                          itemCount: 5),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: Responsive.height * 2),
                      child: CommonTextWidget(
                        color: Colors.grey[500] ?? Colors.grey,
                        text: 'New Arrivals',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height * 30,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProdcutDetails(),
                                ),
                              );
                            },
                            child: const ProductWidget(
                              product: 'ajanjnfjnl',
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizeBoxV(Responsive.width * 5),
                      ),
                    ),
                    const MapScreen()
                  ],
                ),
              ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeController>().getProductsFn();
  }
}
