import 'package:event_testing/Featuer/Guests/data/guest_model.dart';
import 'package:event_testing/core/style.dart';
import 'package:flutter/material.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({
    super.key,
    required this.guest,
  });

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 10,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            guest.imageUrl,
          ),
          radius: 30,
        ),
        title: Text(
          guest.name,
          style: Styles.textStyleAppBar,
        ),
        subtitle: Text(
          guest.description,
          style: Styles.textStyleAppBar,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.purple[800],
        ),
        onTap: () {
          // يمكن إضافة تفاصيل إضافية هنا عند النقر
        },
      ),
    );
  }
}
