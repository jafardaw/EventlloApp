import 'package:event_testing/Featuer/Requirment/presentation/veiw/widget/requirment_view_body.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RequirmentView extends StatelessWidget {
  const RequirmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'المتطلبات الرئيسية'),
      body: RequirmentViewBody(),
    );
  }
}
