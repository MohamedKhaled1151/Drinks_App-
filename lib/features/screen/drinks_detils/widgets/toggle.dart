import 'package:boot_cump/features/screen/drinks_detils/widgets/qty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => ToggleState();
}

class ToggleState extends State<Toggle> {
  bool isSelected1 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            _buildToggleSelection('Hot', !isSelected1),
            SizedBox(width: 3.w),
            _buildToggleSelection('Cold', isSelected1),
            SizedBox(width: 50.w),
            QtyWidget()
          ],
        ));
  }

  Widget _buildToggleSelection(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected1 = label == "Cold";
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCirc,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
              color: isSelected ? Colors.brown.shade300 : Colors.transparent,
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(
                color: isSelected ? Colors.brown.shade300 : Colors.grey,
              )),
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
