import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/style.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SalaOwnersScreen extends StatefulWidget {
  const SalaOwnersScreen({super.key});

  @override
  SalaOwnersScreenState createState() => SalaOwnersScreenState();
}

class SalaOwnersScreenState extends State<SalaOwnersScreen> {
  int? selectedIndex;

  List<String> salaOwners = [
    'صاحب الصالة 1',
    'صاحب الصالة 2',
    'صاحب الصالة 3',
    'صاحب الصالة 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {},
          child: const Icon(Icons.arrow_circle_right_rounded)),
      appBar: CustomAppBar(
        title: tr('planners'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Eventllo',
              style: Styles.textStyleAppBar,
            ),
          )
        ],
      ),
      body: Container(
        decoration: linearGradientMethod(),
        child: Column(
          children: [
            const Icon(
              Icons.admin_panel_settings,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              tr('please_ontap'),
              style: Styles.textStyleAppBar,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                // scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // عدد الأعمدة (1 لعرض أفقي)
                  mainAxisSpacing: 20.0, // المسافة بين العناصر عموديًا
                  childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع للعنصر
                ),
                itemCount: salaOwners.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      padding: const EdgeInsets.all(16.0),
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: selectedIndex == index
                            ? const LinearGradient(
                                colors: [
                                  Colors.purple,
                                  Colors.deepPurpleAccent
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : LinearGradient(
                                colors: [Colors.white, Colors.grey[200]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          if (selectedIndex == index)
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.4),
                              blurRadius: 15.0,
                              offset: const Offset(0, 8),
                            ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[600],
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            salaOwners[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (selectedIndex != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: CustomButton(
                  onTap: () {
                    // قم بتنفيذ عملية الإرسال هنا
                    print('تم النقر على زر إرسال');
                  },
                  text: tr('confirm_order'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
