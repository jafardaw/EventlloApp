import 'package:event_testing/Featuer/planners/presentaion/manger/place_cubit/place_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/planner_view_body.dart';

class PlannersView extends StatelessWidget {
  const PlannersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()..fetchPlaces(),
      child: const PlannersViewBody(),
    );
  }
}
