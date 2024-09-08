import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ElevatedBottonAuth extends StatelessWidget {
  const ElevatedBottonAuth({
    super.key,
    required GlobalKey<FormState> formSignupKey,
    required this.agreePersonalData,
  }) : _formSignupKey = formSignupKey;

  final GlobalKey<FormState> _formSignupKey;
  final bool agreePersonalData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formSignupKey.currentState!.validate() && agreePersonalData) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(tr('processing_data')),
            ),
          );
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (e) => const HomeView(),
          //       ),
          //     );
        } else if (!agreePersonalData) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(tr('agree_personal_data')),
            ),
          );
        }
      },
      child: Text(tr('sign_up')),
    );
  }
}
