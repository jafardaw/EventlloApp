import 'package:event_testing/Featuer/Auth/presentaion/manger/auth_cubit/user_cubit_cubit.dart';
import 'package:event_testing/Featuer/Guests/presentation/view/guest_view.dart';
import 'package:event_testing/Featuer/Requirment/presentation/veiw/requirment_view.dart';
import 'package:event_testing/Featuer/Requirment/presentation/veiw/widget/requirment_view_body.dart';
import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_repo.dart';
import 'package:event_testing/Featuer/home/presentation/widget/detailes_one_event.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/requirement/requirment_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_repo.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/special_requirement_cubit/special_requirement_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/detalies_hala.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/sala_owners_screen.dart';
import 'package:event_testing/cusomer.dart';
import 'package:event_testing/home_events/home_view_events.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/dealet_sala/delect_sala_cubit.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/sala_cubit/sala_cubit.dart';
import 'package:event_testing/test_hala_veiw/presentation/view/sala_view.dart';
import 'package:event_testing/test_hala_veiw/presentation/view/widget/sala_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/user_profile/user_profile_cubit.dart';
import 'package:event_testing/core/theme/theme.dart';
import 'package:event_testing/core/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(Dio()),
          ),
          BlocProvider(
            create: (context) => UserCubitCubit(),
          ),
          BlocProvider(
            create: (context) => AddGuestCubit(),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(), // تحقق من إنشاء ThemeCubit هنا
          ),
          BlocProvider(
            create: (context) =>
                SpecialRequirmentCubit(), // تحقق من إنشاء ThemeCubit هنا
          ),
          BlocProvider(
            create: (context) =>
                RequirmentCubit(), // تحقق من إنشاء ThemeCubit هنا
          ),
          BlocProvider(
            create: (context) =>
                DeleatSalaCubit(), // تحقق من إنشاء ThemeCubit هنا
          ),
          BlocProvider(
            create: (context) => SalaCubit()..fetchPlaces(), // تحقق من إنشاء ThemeCubit هنا
          ),
          BlocProvider(
            create: (context) =>
                EventCubit(EventRepository())..fetchEventscubit(),
          ),
          BlocProvider(
            create: (context) => SearchPlacesCubit(ApiServiceSerchPlaces()),
          ),
        ],
        child: const EventProject(),
      ),
    ),
  );
}

class EventProject extends StatelessWidget {
  const EventProject({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode, // تحقق من استخدام themeMode هنا
          home: const SalaViewBody(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
