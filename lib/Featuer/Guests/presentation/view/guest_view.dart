import 'package:event_testing/Featuer/Guests/presentation/view/widget/guest_view_body.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:event_testing/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class GusetsView extends StatelessWidget {
  const GusetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: 'الضيوف'),
      body: GusetsViewBody(),
    );
  }
}
