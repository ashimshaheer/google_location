import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/extentions.dart';
import '../../../utils/size_box.dart';
import '../../location_details/view/location_detail.dart';
import '../widgets/common_button.dart';

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the bottom sheet full height if needed
    backgroundColor: Colors.white,
    enableDrag: true,
    showDragHandle: true,
    useSafeArea: true,

    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    // ),
    builder: (context) {
      return const BookingScreen();
    },
  );
}

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Responsive.width * 100,
        height: Responsive.height * 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Responsive.width * 10,
                      height: Responsive.height * 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: const Center(child: Icon(Icons.arrow_back_ios)),
                    ),
                    const CommonTextWidget(
                      color: Color(0xff000405),
                      text: 'Location Details',
                      height: 21,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Color(0xff0A0E0F),
                        ),
                        SizeBoxV(16),
                        Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Color(0xff0A0E0F),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Responsive.height * 38,
                child: Stack(
                  children: [
                    Image.asset('assets/images/Frame.png'),
                    Positioned(
                      top: 160,
                      left: 20,
                      right: 20,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x29000000), // Shadow color (#00000029 in ARGB format)
                              offset: Offset(0, 1), // Horizontal (x) and vertical (y) offsets
                              blurRadius: 2, // Blur radius
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonTextWidget(
                              color: Color(0xff000405),
                              text: 'Durgam Cheruvu Park',
                              height: 21,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/location.png',
                                ),
                                const Expanded(
                                  child: CommonTextWidget(
                                    color: Color(0xff000405),
                                    text:
                                        'C9PQ+GF3, Kavuri Hills Phase 1, Doctors Colony,Madhapur, Hyderabad, Telangana 500033',
                                    height: 15,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    align: TextAlign.start,
                                    overFlow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timing Section
                    CommonTextWidget(
                      color: Color(0xff000405),
                      text: "Timing",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    SubtextWidgets(),
                    SizedBox(height: 16),

                    // Offer Section

                    CommonTextWidget(
                      color: Color(0xff000405),
                      text: "Offer",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    SubtextWidgets(
                      text: '• Coupons',
                    ),

                    SizedBox(height: 16),

                    // Event Section
                    CommonTextWidget(
                      color: Color(0xff000405),
                      text: "Event",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    SubtextWidgets(
                      text: 'Saturday, 10 MAY 2024 - Sunday 26 May 2024\nDiscover Sailing | 8yrs + | 1hr 30mins',
                    ),

                    SizedBox(height: 8),
                    CommonTextWidget(
                      color: Color(0xff000405),
                      text: "Why you should attend :",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    SubtextWidgets(
                      text: '• Exotic water sports\n• Fitness\n• Adventure',
                    ),
                  ],
                ),
              ),
              SizeBoxH(Responsive.height * 6),
              CommonButton(
                onTap: () {
                  _showModalBottomSheet(context);
                },
              ),
              SizeBoxH(Responsive.height * 4),
            ],
          ),
        ),
      ),
    );
  }
}

class SubtextWidgets extends StatelessWidget {
  final String? text;
  const SubtextWidgets({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: CommonTextWidget(
        color: const Color(0xff000405),
        text: text ?? "• Monday - Friday : 10am–9pm\n• Saturday - Sunday : 10am–11pm",
        fontSize: 15,
        height: 1.5,
        align: TextAlign.start,
      ),
    );
  }
}
