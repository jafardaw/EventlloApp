import 'package:event_testing/home_events/update_events_view_body.dart';
import 'package:flutter/material.dart';

class UpdateEventsView extends StatelessWidget {
  const UpdateEventsView({super.key, required this.id});
  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Update Event',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  UpdateEventsViewBody(id: id),
    );
  }

}
