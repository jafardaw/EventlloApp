import 'package:event_testing/Featuer/Auth/presentaion/view/signin_screen.dart';
import 'package:event_testing/Featuer/Auth/presentaion/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RowNavigatorAuthwidget extends StatelessWidget {
  const RowNavigatorAuthwidget({
    super.key,
    required this.text,
    required this.text1,
  });
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.tr(),
          style: const TextStyle(
            color: Colors.black45,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (text1.toLowerCase() == 'sign up'.toLowerCase()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            } else if (text1.toLowerCase() == 'sign in'.toLowerCase()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            }
          },
          child: Text(
            text1.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
