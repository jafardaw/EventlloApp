import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color titleColor;
  final EdgeInsets contentPadding;
  final BorderRadius borderRadius;
  final Color borderColor;
  final double borderWidth;

  const CustomSwitchListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.green,
    this.inactiveThumbColor = Colors.grey,
    this.inactiveTrackColor = Colors.grey,
    this.titleFontSize = 16.0,
    this.titleFontWeight = FontWeight.bold,
    this.titleColor = Colors.grey,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.borderColor = Colors.purple,
    this.borderWidth = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: titleFontWeight,
            color: titleColor,
          ),
        ),
        value: value,
        activeColor: activeColor,
        inactiveThumbColor: inactiveThumbColor,
        inactiveTrackColor: inactiveTrackColor,
        onChanged: onChanged,
        contentPadding: contentPadding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
