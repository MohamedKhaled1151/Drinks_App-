import 'package:boot_cump/features/screen/hom_screan/home_screan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
  
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      
        
         home:HomeScrean (),
      
      ),
    );
  }
}