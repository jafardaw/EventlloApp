import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePagemove extends StatefulWidget {
  const MyHomePagemove({
    super.key,
  });

  @override
  MyHomePagemoveState createState() => MyHomePagemoveState();
}

class MyHomePagemoveState extends State<MyHomePagemove> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int offerLength = 3; // متغير لحفظ طول القائمة

  @override
  void initState() {
    super.initState();

    // نستخدم addPostFrameCallback لضمان تحميل الويدجت
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (_pageController.hasClients && offerLength > 0) {
          int nextPage = _pageController.page!.round() + 1;
          if (nextPage >= offerLength) {
            nextPage = 0; // عودة إلى البداية
          }
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: offerLength,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            // تأثيرات تحريك للانتقال بين الصور
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * .5))
                  .clamp(0.0, 1.0); // تغيير القيمة لتأثير أكثر نعومة
            }
            return Center(
              child: SizedBox(
                // تعديل الأبعاد لجعل الصورة والحاوية أكبر
                height: Curves.easeOut.transform(value) *
                    MediaQuery.of(context).size.height,
                width: Curves.easeOut.transform(value) *
                    MediaQuery.of(context).size.width,
                child: child,
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                // إزالة الهوامش
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // حدود منحنية
                  image: const DecorationImage(
                    image: AssetImage('assets/images/birthday.jpg'),
                    fit: BoxFit.cover, // لتغطية الحاوية بالكامل
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 20,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
              ),

              // يمكن إضافة المزيد من العناصر هنا إذا لزم الأمر
            ],
          ),
        );
      },
    );
    // حالة البداية أو حالات أخرى
  }
}
