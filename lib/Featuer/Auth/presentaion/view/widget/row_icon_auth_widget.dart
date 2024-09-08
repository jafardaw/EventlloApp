import 'package:flutter/material.dart';

class RowIconAuthWidget extends StatelessWidget {
  const RowIconAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.facebook),
        Icon(Icons.apple),
        Icon(
          Icons.snapchat,
        ),
      ],
    );
  }
}