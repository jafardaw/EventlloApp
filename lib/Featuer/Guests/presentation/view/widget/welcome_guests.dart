import 'package:event_testing/core/style.dart';
import 'package:flutter/material.dart';

class WelcomGuests extends StatelessWidget {
  const WelcomGuests({
    super.key,
    this.welo,
  });

  @override
  final welo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.group,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          'Welcome to the Guest List',
          style: Styles.textStyleAppBar,
        ),
        Text(
          'Here are our special guests for the event.',
          style: Styles.textStyleAppBar,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
