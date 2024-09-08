import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_state.dart';
import 'package:event_testing/Featuer/home/presentation/widget/slider_move_photo.dart';
import 'package:event_testing/core/function/error_view.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom_drawer.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/sala_cubit/sala_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/function/linear_gradient_method.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'event_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  HomeViewBodyState createState() => HomeViewBodyState();
}

class HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'app_title'.tr()),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: linearGradientMethod(),
        child: Column(
          children: [
            const AspectRatio(
              aspectRatio: 7 / 4,
              child: MyHomePagemove(),
            ),
            BlocConsumer<EventCubit, EventState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EventLoading) {
                  return buildLoadingIndicator();
                }
                if (state is EventLoaded) {
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        return EventCard(
                          event: state.events[index],
                        );
                      },
                    ),
                  );
                }
                if (state is EventError) {
                  return buildErrorWidget('error.message'.tr());
                }
                return const SizedBox(height: 8, width: 8);
              },
            ),
          ],
        ),
      ),
    );
  }
}

  // Drawer drawerMethod() {

  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: <Widget>[
  //         const DrawerHeader(
  //           decoration: BoxDecoration(
  //             color: Colors.purple,
  //           ),
  //           child: Text(
  //             'إعدادات التطبيق',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 24,
  //             ),
  //           ),
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.language),
  //           title: Text(isArabic
  //               ? 'التعديل إلى اللغة الأجنبية'
  //               : 'التعديل إلى اللغة العربية'),
  //           onTap: _toggleLanguage,
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.exit_to_app),
  //           title: const Text('تسجيل الخروج'),
  //           onTap: () {},
  //           // تغيير الدالة المستدعاة عند النقر
  //         ),
  //       ],
  //     ),
  //   );
  // }

