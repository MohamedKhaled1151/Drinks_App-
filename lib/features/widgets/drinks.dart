import 'package:boot_cump/features/screen/drinks_detils/screan_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Drinks extends StatelessWidget {
  final String name;
  final String image;
  final String title;
  final String price;
  final int index;
  const Drinks(
      {super.key,
      required this.name,
      required this.image,
      required this.title,
      required this.price,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreanDetails(initialIndex: index),
              )),
          child: Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 25.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(price,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -20.h,
          child: Stack(alignment: Alignment.bottomLeft, children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      blurRadius: 25.r,
                      spreadRadius: 2.dg,
                    )
                  ]),
            ),
            Image.asset(
              image,
              height: 90.h,
              width: 90.w,
              fit: BoxFit.contain,
            ),
          ]),
        ),
        Positioned(
          top: 50.h,
          bottom: 20.h,
          right: 20.w,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black45)),
            child: Icon(Icons.arrow_forward, size: 17.r, color: Colors.black54),
          ),
        )
      ],
    );
  }
}
