
 
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/router/router.dart';
import 'package:taskingdom/core/utils/themes.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/vip_home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, c) {
          return DevicePreview(
              builder: (context) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child:  MaterialApp(
                    
                      themeMode: ThemeMode.light,
                      theme: AppTheme.darkTheme,
                      darkTheme: AppTheme.darkTheme,
             
                      home: VipHomeScreen(),
                       
                      routes: AppRouter.routes,
                      debugShowCheckedModeBanner: false,
                    ),
                );
              },);
        },);
  }
}
