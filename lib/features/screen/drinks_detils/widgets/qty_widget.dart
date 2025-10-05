import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

int qty = 1;

class _QtyWidgetState extends State<QtyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          _buildQtyButton(Icons.remove, () {
            setState(() {
              if (qty > 1) qty--;
            });
          }),
          SizedBox(width: 8.w),
          Text(
            qty.toString(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.w),
          _buildQtyButton(Icons.add, () {
            setState(() {
              qty++;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildQtyButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22.sp,
        ),
      ),
    );
  }
}
