import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'CORE/constant.dart';
import 'GUI/home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SportiPay',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffFAFAFA),
              appBarTheme: AppBarTheme(
                  backgroundColor: lightBGColor,
                  elevation: 0,
                  centerTitle: true,
                  titleTextStyle: t20w600),
              iconTheme: IconThemeData(color: blackColor),
            ),
            // home: LandingPage(),
            builder: EasyLoading.init(),
            home: HomePage(),
          );
        });
  }
}
