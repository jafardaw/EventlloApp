import 'package:event_testing/Featuer/Auth/presentaion/manger/auth_cubit/user_cubit_cubit.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/user_profile/user_profile_cubit.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/user_profile/user_profile_state.dart';
import 'package:event_testing/Featuer/Auth/presentaion/view/signin_screen.dart';
import 'package:event_testing/core/function/show_alert.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/theme/theme_cubit.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/core/style.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  late bool isArabic;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isArabic = context.locale.languageCode == 'ar';
    context.read<UserCubit>().fetchUser(); // Ensure UserProfileCubit is used
  }

  void _toggleLanguage() {
    setState(() {
      isArabic = !isArabic;
      if (isArabic) {
        context.setLocale(const Locale('ar', 'AE'));
      } else {
        context.setLocale(const Locale('en', 'US'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            return Column(
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/photo_2024-08-01_02-44-48.jpg'), // استبدل هذا المسار بمسار الصورة الخاص بك
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      tr('app_settings'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                if (userState is UserLoaded)
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(userState.user.name),
                        subtitle: Text(userState.user.email),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text(tr('account_creation_date')),
                        subtitle: Text(DateFormat('yyyy-MM-dd')
                            .format(userState.user.createdAt)),
                      ),
                    ],
                  ),
                if (userState is UserError)
                  ListTile(
                    leading: const Icon(Icons.error),
                    title: Text(tr('loading_error')),
                    subtitle: Text(userState.errorMessage),
                  ),
                if (userState is UserLoading)
                  Center(
                    child: Text(
                      tr('loading_user_data'),
                      style: Styles.textStyleAppBar.copyWith(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      isArabic
                          ? tr('change_language_to_english')
                          : tr('change_language_to_arabic'),
                    ),
                    onTap: () {
                      showCustomAlertDialog(
                          content: 'language_content'.tr(),
                          context: context,
                          title: 'language_title'.tr(),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors
                                      .purple, // لون النص والأيقونات على الزر
                                  shadowColor: Colors.purple, // لون الظل
                                  elevation: 5, // ارتفاع الظل خلف الزر
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // تقريب حواف الزر
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 15), // التبطين الداخلي للزر
                                ),
                                child: Text(
                                  'cancel'.tr(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(); // إغلاق الحوار
                                },
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors
                                    .purple, // لون النص والأيقونات على الزر
                                shadowColor: Colors.purple, // لون الظل
                                elevation: 5, // ارتفاع الظل خلف الزر
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), // تقريب حواف الزر
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15), // التبطين الداخلي للزر
                              ),
                              child: Text(
                                'change'.tr(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _toggleLanguage();
                              },
                            ),
                          ]);
                    }),
                ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: Text(tr('change_theme')),
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: Text(tr('logout')),
                  onTap: () {
                    showCustomAlertDialog(
                      context: context,
                      title: 'logout_title'.tr(),
                      content: 'logout_content'.tr(),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.purple,
                              shadowColor: Colors.purple,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: Text(
                              'cancel'.tr(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        BlocConsumer<UserCubitCubit, UserCubitState>(
                          listener: (context, state) {
                            if (state is LogoutSuccess) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                              showCustomSnackBar(context, state.message,
                                  color: Colors.purpleAccent);
                            } else if (state is LogoutFailure) {
                              showCustomSnackBar(context, state.errorMessage,
                                  color: Colors.red);
                            }
                          },
                          builder: (context, state) {
                            if (state is LogoutLoading) {
                              return buildLoadingIndicator();
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.purple,
                                shadowColor: Colors.purple,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                              ),
                              child: Text(
                                'logout'.tr(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                context.read<UserCubitCubit>().logout();
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
