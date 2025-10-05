import 'package:boot_cump/features/widgets/drinks.dart';
import 'package:boot_cump/models/drinks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

ScrollController controller = ScrollController();

class _HomeScreanState extends State<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: DrinksModel.drinks.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double offset = 0;
                          if (controller.hasClients) {
                            offset = controller.offset / 80 - index;
                          }
                          offset = offset.clamp(0, 4);
                          return Transform.scale(
                            scale: 1 - (offset * 0.2),
                            child: Drinks(
                              name: DrinksModel.drinks[index].name,
                              image: DrinksModel.drinks[index].image,
                              title: DrinksModel.drinks[index].title,
                              price: DrinksModel.drinks[index].price,
                              index: index,
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
