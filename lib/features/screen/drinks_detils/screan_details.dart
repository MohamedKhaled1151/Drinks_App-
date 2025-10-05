import 'package:boot_cump/features/screen/drinks_detils/widgets/custom_list.dart';
import 'package:boot_cump/features/screen/drinks_detils/widgets/toggle.dart';
import 'package:boot_cump/models/drinks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreanDetails extends StatefulWidget {
  const ScreanDetails({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<ScreanDetails> createState() => _ScreanDetailsState();
}

class _ScreanDetailsState extends State<ScreanDetails> {
  late PageController _controller;
  double _currentPage = 0.0;

  final drinks = DrinksModel.drinks;
  int selectItem = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.60,
      initialPage: widget.initialIndex,
    );

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? widget.initialIndex.toDouble();
      });
    });

    _currentPage = widget.initialIndex.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 80.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      drinks[_currentPage.toInt()].name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      drinks[_currentPage.toInt()].title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Text(
                  drinks[_currentPage.toInt()].price,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              double baseScale = 1 - (_currentPage - index).abs() * 1;
              double extraScale = 1.0;
              if (selectItem == 0) {
                extraScale = 1.1;
              } else if (selectItem == 1) {
                extraScale = 1.0;
              } else if (selectItem == 2) {
                extraScale = 0.8;
              }

              final scale = (baseScale * extraScale).clamp(0.5, 1.5);

              final translatey = (_currentPage - index).abs() * 400.h;
              return Transform.translate(
                offset: Offset(translatey, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.5),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            drinks[index].image,
                            height: 600.h,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                              bottom: 100.h,
                              right: 0.w,
                              left: 0.w,
                              child: Image.asset("assets/drinks/shadow.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
              top: 550.h,
              left: 0.h,
              right: 0.h,
              bottom: 0.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(sizeIcons.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(10.r),
                      child: InkWell(
                        onTap: () {
                          if (index == sizeIcons.length - 1) {
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              selectItem = index;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Column(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black87,
                                    ),
                                    color: selectItem == index
                                        ? Colors.brown.shade300
                                        : Colors.white),
                                child: Icon(
                                  sizeIcons[index],
                                  color: selectItem == index
                                      ? Colors.brown
                                      : Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                sizeLabels[index],
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: selectItem == index
                                      ? Colors.brown
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )),
          Positioned(
            bottom: 35.h,
            left: 0,
            right: 0,
            child: Toggle(),
          ),
        ],
      ),
    );
  }
}
